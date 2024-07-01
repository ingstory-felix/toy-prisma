// 1. Prisma 템플릿 클래스 (앞서 설명한 방식)

// 2. Repository 패턴 (앞서 설명한 방식)

// 3. Active Record 패턴
import { PrismaClient, User as PrismaUser } from '@prisma/client'

class User {
  private static prisma = new PrismaClient()

  id?: number
  email: string
  name: string

  constructor(email: string, name: string) {
    this.email = email
    this.name = name
  }

  async save(): Promise<void> {
    if (this.id) {
      await User.prisma.user.update({
        where: { id: this.id },
        data: { email: this.email, name: this.name }
      })
    } else {
      const user = await User.prisma.user.create({
        data: { email: this.email, name: this.name }
      })
      this.id = user.id
    }
  }

  static async findByEmail(email: string): Promise<User | null> {
    const user = await this.prisma.user.findUnique({ where: { email } })
    if (user) {
      const newUser = new User(user.email, user.name)
      newUser.id = user.id
      return newUser
    }
    return null
  }

  static async findAll(): Promise<User[]> {
    const users = await this.prisma.user.findMany()
    return users.map(u => {
      const user = new User(u.email, u.name)
      user.id = u.id
      return user
    })
  }
}

// 사용 예시
const user = new User('test@example.com', 'Test User')
await user.save()
const foundUser = await User.findByEmail('test@example.com')

// 4. Data Mapper 패턴
import { PrismaClient, User as PrismaUser } from '@prisma/client'

// 도메인 모델
class User {
  constructor(
    public id: number | undefined,
    public email: string,
    public name: string
  ) {}

  validateEmail(): boolean {
    return this.email.includes('@')
  }
}

// Data Mapper
class UserMapper {
  private prisma: PrismaClient

  constructor() {
    this.prisma = new PrismaClient()
  }

  async save(user: User): Promise<User> {
    if (user.id) {
      const updatedUser = await this.prisma.user.update({
        where: { id: user.id },
        data: { email: user.email, name: user.name }
      })
      return new User(updatedUser.id, updatedUser.email, updatedUser.name)
    } else {
      const newUser = await this.prisma.user.create({
        data: { email: user.email, name: user.name }
      })
      return new User(newUser.id, newUser.email, newUser.name)
    }
  }

  async findByEmail(email: string): Promise<User | null> {
    const user = await this.prisma.user.findUnique({ where: { email } })
    return user ? new User(user.id, user.email, user.name) : null
  }

  async findAll(): Promise<User[]> {
    const users = await this.prisma.user.findMany()
    return users.map(u => new User(u.id, u.email, u.name))
  }
}

// 사용 예시
const userMapper = new UserMapper()
const user = new User(undefined, 'test@example.com', 'Test User')
if (user.validateEmail()) {
  const savedUser = await userMapper.save(user)
}
const foundUser = await userMapper.findByEmail('test@example.com')

// 비교 및 분석

// 1. Prisma 템플릿 클래스
// 장점: 구현이 간단하고 직관적
// 단점: 비즈니스 로직과 데이터 액세스 로직이 혼재될 수 있음

// 2. Repository 패턴
// 장점: 관심사 분리, 테스트 용이성, 유연성
// 단점: 초기 설정이 더 복잡함

// 3. Active Record 패턴
// 장점: 
// - 객체와 데이터베이스 레코드 간의 직접적인 매핑
// - 사용이 간단하고 직관적임
// 단점: 
// - 도메인 로직과 데이터 액세스 로직이 혼재됨
// - 단일 책임 원칙을 위반할 수 있음
// - 테스트가 어려울 수 있음

// 4. Data Mapper 패턴
// 장점:
// - 도메인 모델과 데이터 액세스 로직의 명확한 분리
// - 복잡한 도메인 로직 구현에 적합
// - 테스트 용이성
// 단점:
// - 구현이 더 복잡하고 초기 설정에 시간이 더 걸림
// - 간단한 CRUD 작업에 대해 과도한 복잡성을 초래할 수 있음

// 선택 기준:
// - Prisma 템플릿 클래스: 작은 프로젝트, 빠른 프로토타이핑
// - Repository 패턴: 중간~대규모 프로젝트, 테스트 중심 개발
// - Active Record: 간단한 도메인 모델, RAD(Rapid Application Development)
// - Data Mapper: 복잡한 도메인 모델, 대규모 엔터프라이즈 애플리케이션