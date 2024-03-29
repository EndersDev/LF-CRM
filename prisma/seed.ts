import * as dotenv from 'dotenv'
import { PrismaClient } from '@prisma/client'
import { Salt, parseSalt } from '../src/auth/password.service'
import { hash } from 'bcrypt'
import { EnumUserStatus } from '../src/user/base/EnumUserStatus'

if (require.main === module) {
  dotenv.config()

  const { BCRYPT_SALT } = process.env

  if (!BCRYPT_SALT) {
    throw new Error('BCRYPT_SALT environment variable must be defined')
  }

  const salt = parseSalt(BCRYPT_SALT)

  seed(salt).catch(error => {
    console.error(error)
    process.exit(1)
  })
}

async function seed(bcryptSalt: Salt) {
  console.info('Seeding database...')

  const client = new PrismaClient()
  const data = {
    username: 'admin',
    password: await hash('admin', bcryptSalt),
    roles: ['user'],
    status: EnumUserStatus.Ativo
  }
  await client.user.upsert({
    where: { username: data.username },
    update: {},
    create: data
  })
  client.$disconnect()
  console.info('Seeded database successfully')
}
