# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.create(name: 'admin',
                    email: 'admin@mail.com',
                    password: 'admin',
                    password_confirmation: 'admin',
                    type: 'admin')

user1 = User.create(name: 'user1',
                    email: 'user1@mail.com',
                    password: 'user1',
                    password_confirmation: 'user1',
                    type: 'general')


user2 = User.create(name: 'user2',
                    email: 'user2@mail.com',
                    password: 'user2',
                    password_confirmation: 'user2',
                    type: 'general')
