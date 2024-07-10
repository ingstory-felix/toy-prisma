const userRepository = require('../repositories/user.repository');

class UserService {
    constructor(prisma) {
        this.userRepository = new userRepository(prisma);
    }

    async createUser(userData) {
        return this.userRepository.create(userData);
    }

    async getUserByEmail(email) {
        return this.userRepository.findByEmail(email);
    }

    async createUserWithPosts(userData, postsData) {
        return this.userRepository.createUserWithPosts(userData, postsData);
    }

    async getUsersWithPublishedPosts() {
        return this.userRepository.getUsersWithPublishedPosts();
    }

    async getUsersByNameStart(nameStart) {
        return this.userRepository.getUsersByRawQuery(nameStart);
    }

    async updateUserEmails(oldDomain, newDomain) {
        return this.userRepository.updateUserEmailsByRawQuery(oldDomain, newDomain);
    }
}

module.exports = UserService;