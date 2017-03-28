# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: 'Test 1', email: 'test1@test.com', password: '123321', password_confirmation: '123321')
user1.add_role :agent
user1.clients.create(name: 'ООО Рога и Копыта', inn: 123124, kpp: 12312312)

user2 = User.create(name: 'Test 2', email: 'test2@test.com', password: '123321', password_confirmation: '123321')
user2.add_role :partner

