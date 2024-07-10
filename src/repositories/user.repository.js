const BaseRepository = require('./base.repository');

class UserRepository extends BaseRepository {
    constructor(prisma) {
        super(prisma, 'user');
    }

    async findByEmail(email) {
        return this.findUnique({ email });
    }

    async createUserWithPosts(userData, postsData) {
        return this.prisma.user.create({
            data: {
                ...userData,
                posts: {
                    create: postsData,
                },
            },
            include: { posts: true },
        });
    }

    async getUsersWithPublishedPosts() {
        return this.findMany({
            where: {
                posts: {
                    some: {
                        published: true,
                    },
                },
            },
            include: { posts: true },
        });
    }

    async getUsersByRawQuery(nameStartsWith) {
        // TODO: base.repository.js에 queryRaw, executeRaw 메서드를 추가하고 상속 받아 사용하도록 수정
        return this.prisma.$queryRaw`SELECT * FROM User WHERE name LIKE ${nameStartsWith+'%'}`;
    }

    async updateUserEmailsByRawQuery(oldDomain, newDomain) {
        // const query = 'UPDATE `User` SET `email` = REPLACE(`email`, $1, $2) WHERE `email` LIKE $3';
        // const params = [oldDomain, newDomain, `%@${oldDomain}`];
        // TODO: base.repository.js에 queryRaw, executeRaw 메서드를 추가하고 상속 받아 사용하도록 수정
        return this.prisma.$executeRaw`UPDATE User SET email = REPLACE(email, ${oldDomain}, ${newDomain}) WHERE email LIKE ${'%@'+oldDomain}`;
    }
}

module.exports = UserRepository;