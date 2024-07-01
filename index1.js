// 1. Prisma 템플릿 클래스 방식

// UserModel.ts
import { PrismaClient, User } from '@prisma/client'

class UserModel {
  private prisma: PrismaClient

  constructor() {
    this.prisma = new PrismaClient()
  }

  async createUser(data: Partial<User>): Promise<User> {
    return this.prisma.user.create({ data })
  }

  async findUserByEmail(email: string): Promise<User | null> {
    return this.prisma.user.findUnique({ where: { email } })
  }
}

// 사용 예시
const userModel = new UserModel()
const newUser = await userModel.createUser({ email: 'test@example.com', name: 'Test User' })

// 장점: 간단하고 직관적인 사용
// 단점: 비즈니스 로직과 데이터 액세스 로직이 혼재될 수 있음

// ------------------------------------------------

// 2. Repository 패턴을 적용한 Prisma 템플릿 방식

// IUserRepository.ts
import { User } from '@prisma/client'

interface IUserRepository {
  createUser(data: Partial<User>): Promise<User>
  findUserByEmail(email: string): Promise<User | null>
}

// UserRepository.ts
import { PrismaClient, User } from '@prisma/client'
import { IUserRepository } from './IUserRepository'

class UserRepository implements IUserRepository {
  private prisma: PrismaClient

  constructor(prisma: PrismaClient) {
    this.prisma = prisma
  }

  async createUser(data: Partial<User>): Promise<User> {
    return this.prisma.user.create({ data })
  }

  async findUserByEmail(email: string): Promise<User | null> {
    return this.prisma.user.findUnique({ where: { email } })
  }
}

// UserService.ts
class UserService {
  private userRepository: IUserRepository

  constructor(userRepository: IUserRepository) {
    this.userRepository = userRepository
  }

  async registerUser(email: string, name: string): Promise<User> {
    const existingUser = await this.userRepository.findUserByEmail(email)
    if (existingUser) {
      throw new Error('User already exists')
    }
    return this.userRepository.createUser({ email, name })
  }
}

// 사용 예시
const prisma = new PrismaClient()
const userRepository = new UserRepository(prisma)
const userService = new UserService(userRepository)

try {
  const newUser = await userService.registerUser('test@example.com', 'Test User')
  console.log('User registered:', newUser)
} catch (error) {
  console.error('Registration failed:', error.message)
}

// 장점: 관심사 분리, 테스트 용이성, 유연성
// 단점: 초기 설정이 더 복잡함

// ------------------------------------------------

// 예제 시나리오: 사용자 등록 기능 변경

// 1. Prisma 템플릿 클래스 방식에서의 변경
class UserModel {
  // ... 기존 코드 ...

  async registerUser(email: string, name: string): Promise<User> {
    const existingUser = await this.findUserByEmail(email)
    if (existingUser) {
      throw new Error('User already exists')
    }
    // 비즈니스 로직 변경: 이메일 도메인 검증 추가
    const emailDomain = email.split('@')[1]
    if (!['example.com', 'test.com'].includes(emailDomain)) {
      throw new Error('Invalid email domain')
    }
    return this.createUser({ email, name })
  }
}

// 2. Repository 패턴을 적용한 Prisma 템플릿 방식에서의 변경
class UserService {
  // ... 기존 코드 ...

  async registerUser(email: string, name: string): Promise<User> {
    const existingUser = await this.userRepository.findUserByEmail(email)
    if (existingUser) {
      throw new Error('User already exists')
    }
    // 비즈니스 로직 변경: 이메일 도메인 검증 추가
    const emailDomain = email.split('@')[1]
    if (!['example.com', 'test.com'].includes(emailDomain)) {
      throw new Error('Invalid email domain')
    }
    return this.userRepository.createUser({ email, name })
  }
}

// 테스트 예시 (Repository 패턴)
import { mock, MockProxy } from 'jest-mock-extended'

describe('UserService', () => {
  let userRepository: MockProxy<IUserRepository>
  let userService: UserService

  beforeEach(() => {
    userRepository = mock<IUserRepository>()
    userService = new UserService(userRepository)
  })

  it('should register a new user with valid email', async () => {
    userRepository.findUserByEmail.mockResolvedValue(null)
    userRepository.createUser.mockResolvedValue({ id: 1, email: 'test@example.com', name: 'Test User' } as User)

    const result = await userService.registerUser('test@example.com', 'Test User')

    expect(result).toEqual({ id: 1, email: 'test@example.com', name: 'Test User' })
  })

  it('should throw an error for invalid email domain', async () => {
    await expect(userService.registerUser('test@invalid.com', 'Test User')).rejects.toThrow('Invalid email domain')
  })
})