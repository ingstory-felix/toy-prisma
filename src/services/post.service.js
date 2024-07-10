const PostRepository = require('../repositories/post.repository');

class PostService {
    constructor(prisma) {
        this.postRepository = new PostRepository(prisma);
    }

    async createPost(postData) {
        return this.postRepository.create(postData);
    }

    async getPublishedPosts() {
        return this.postRepository.findPublished();
    }

    async updatePostPublishStatus(id, publishStatus) {
        return this.postRepository.updatePublishStatus(id, publishStatus);
    }

    async getPostsWithAuthors() {
        return this.postRepository.getPostsWithUsersByRawQuery();
    }
}

module.exports = PostService;