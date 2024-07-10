const BaseRepository = require('./base.repository');

class PostRepository extends BaseRepository {
    constructor(prisma) {
        super(prisma, 'post');
    }

    async findPublished() {
        return this.findMany({ where: { published: true } });
    }

    async updatePublishStatus(id, publishStatus) {
        return this.update({ id }, { published: publishStatus });
    }

    async getPostsWithUsersByRawQuery() {

        return this.prisma.$queryRaw`SELECT p.*, u.name as authorName, u.email as authorEmail FROM Post p JOIN User u ON p.authorId = u.id`;
    }
}

module.exports = PostRepository;