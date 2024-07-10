const { Prisma } = require('@prisma/client');
class BaseRepository {
    constructor(prisma, model) {
        this.prisma = prisma;
        this.model = model;
    }

    async findUnique(where) {
        return this.prisma[this.model].findUnique({ where });
    }

    async findMany(args = {}) {
        return this.prisma[this.model].findMany(args);
    }

    async create(data) {
        return this.prisma[this.model].create({ data });
    }

    async update(where, data) {
        return this.prisma[this.model].update({ where, data });
    }

    async delete(where) {
        return this.prisma[this.model].delete({ where });
    }

    // async queryRaw(query, params) {
    //     const sql = Prisma.sql`SELECT * FROM User WHERE email = ${params}`
    //     return this.prisma.$queryRaw`${query}${params}`;
    // }
    //
    // async executeRaw(query, params) {
    //     return this.prisma.$executeRaw`${query}${params}`;
    // }
}

module.exports = BaseRepository;