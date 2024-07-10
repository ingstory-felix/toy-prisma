const { PrismaClient } = require('@prisma/client');
const CustomError = require('./Utils/CustomError');

class PrismaClientManager {
    static instance = null;
    #prismaClient = null;
    #isConnected = false;

    constructor(initialLogLevels = ['query', 'info', 'warn', 'error']) {
        if (PrismaClientManager.instance) {
            return PrismaClientManager.instance;
        }
        this.logLevels = this.validateAndParseLogLevels(initialLogLevels);
        PrismaClientManager.instance = this;
    }

    validateAndParseLogLevels(levels) {
        const validLevels = ['query', 'info', 'warn', 'error'];
        if (typeof levels === 'string') {
            levels = levels.split(',').map(level => level.trim());
        }
        if (!Array.isArray(levels)) {
            throw new CustomError('Log levels must be an array or a comma-separated string');
        }
        const filteredLevels = levels.filter(level => validLevels.includes(level));
        return new Set(filteredLevels);
    }

    async getPrismaClient() {
        if (!this.#prismaClient) {
            this.#prismaClient = this.createPrismaClient();
        }
        return this.#prismaClient;
    }

    createPrismaClient() {
        const logOptions = [
            { emit: 'event', level: 'query' },
            ...['info', 'warn', 'error'].map(level => ({ emit: 'stdout', level }))
        ].filter(option => this.logLevels.has(option.level));

        this.#prismaClient = new PrismaClient({
            log: logOptions,
            errorFormat: 'pretty',
        });

        if (this.logLevels.has('query')) {
            this.#prismaClient.$on('query', (e) => {
                console.log('Query: ' + e.query);
                console.log('Params: ' + e.params);
                console.log('Duration: ' + e.duration + 'ms');
                console.log('--------------------');
            });
        }

        return this.#prismaClient;
    }

    async connect() {
        if (this.#isConnected) {
            console.log('Already connected to the database');
            return;
        }

        try {
            await this.#prismaClient.$connect();
            this.#isConnected = true;
            console.log('Successfully connected to the database:', process.env.DATABASE_URL);
        } catch (error) {
            console.error('Failed to connect to the database:', process.env.DATABASE_URL);
            console.error('error', error);
            throw error;
        }
    }

    async disconnect() {
        if (!this.#isConnected) {
            console.log('Not connected to the database');
            return;
        }

        try {
            await this.#prismaClient.$disconnect();
            this.#isConnected = false;
            console.log('Successfully disconnected from the database');
        } catch (error) {
            console.error('Failed to disconnect from the database:', error);
            throw error;
        }
    }
}

const prismaClientManager = new PrismaClientManager(process.env.PRISMA_LOG_LEVELS || '');
module.exports = prismaClientManager;