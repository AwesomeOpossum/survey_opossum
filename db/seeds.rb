# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

zack = Author.create!(name: "Zack Strickland", email: "zas0923@gmail.com", password: "password")
bob = Author.create!(name: "Bob Jones", email: "bob@bob.com", password: "password1")
tim = Author.create!(name: "Tim Little", email: "time@tim.com", password: "password2")
