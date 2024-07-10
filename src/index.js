const { PrismaClient } = require('@prisma/client');
const UserRepository = require('./repositories/user.repository');
const PostRepository = require('./repositories/post.repository');
const UserService = require('./services/user.service');
const PostService = require('./services/post.service');
const {faker} = require("@faker-js/faker");

const express = require('express');
const prismaClientManager = require('./PrismaClientManager');

const app = express();
const port = 3000;


app.get('/', async (req, res) => {
    try {
        const prismaClient = await prismaClientManager.getPrismaClient();
        const userService = new UserService(prismaClient);
        const newMockUser = [{
            email: faker.internet.email(),
            name: faker.internet.userName()
        }];
        // 사용자 생성
        const newUser = await userService.createUser(newMockUser[0]);
    } catch (error) {
        console.error('Error:', error);
    }

    res.send('Hello World!');
});
app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});

async function init() {
    const prismaClient = await prismaClientManager.getPrismaClient();
    await prismaClientManager.connect();

    const userService = new UserService(prismaClient);
    const postService = new PostService(prismaClient);

    const newMockUser = [{
        email: faker.internet.email(),
        name: faker.internet.userName()
    }, {
        email: faker.internet.email(),
        name: faker.internet.userName()
    }];
    // 사용자 생성
    const newUser = await userService.createUser(newMockUser[0]);
}

init().then(() => {
    console.log('PrismaClient is ready');
}).catch((e) => {
    console.error('Failed to initialize PrismaClient:', e);
});
async function main() {
    try {
        const newMockUser = [{
            email: faker.internet.email(),
            name: faker.internet.userName()
        }, {
            email: faker.internet.email(),
            name: faker.internet.userName()
        }];

        const prismaClient = await prismaClientManager.getPrismaClient();
        await prismaClientManager.connect();


        const userRepository = new UserRepository(prismaClient);
        const postRepository = new PostRepository(prismaClient);

        const userService = new UserService(userRepository);
        const postService = new PostService(postRepository);

        // 사용자 생성
        const newUser = await userService.createUser(newMockUser[0]);
        // console.log('Created new user:', newUser);

        // 사용자와 포스트 함께 생성
        const userWithPosts = await userService.createUserWithPosts(
            newMockUser[1],
            [{ title: 'My first post', content: 'Hello, world!', published: true }]
        );
        // console.log('Created user with posts:', userWithPosts);

        // 게시된 포스트가 있는 사용자 조회
        const usersWithPublishedPosts = await userService.getUsersWithPublishedPosts();
        // console.log('Users with published posts:', usersWithPublishedPosts);

        // 게시된 포스트 조회
        const publishedPosts = await postService.getPublishedPosts();
        // console.log('Published posts:', publishedPosts);

        // 포스트 게시 상태 업데이트
        const updatedPost = await postService.updatePostPublishStatus(userWithPosts.posts[0].id, false);
        // console.log('Updated post:', updatedPost);

        // Raw query를 사용하여 사용자 조회
        const usersStartingWithA = await userService.getUsersByNameStart('A');
        // console.log('Users starting with A:', usersStartingWithA);

        // Raw query를 사용하여 이메일 도메인 업데이트
        const updatedEmails = await userService.updateUserEmails('old.com', 'new.com');
        // console.log('Updated email count:', updatedEmails);

        // Raw query를 사용하여 포스트와 작성자 정보 조회
        const postsWithAuthors = await postService.getPostsWithAuthors();
        // console.log('Posts with authors:', postsWithAuthors);

    } catch (error) {
        console.error('Error:', error);
    } finally {
        await prismaClientManager.disconnect();
    }
}

// main()
//     .catch((e) => {
//         throw e;
//     })
//     .finally(async () => {
//         await prismaClientManager.disconnect();
//     });

