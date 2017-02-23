# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Match.destroy_all
Offer.destroy_all
User.destroy_all

snake = User.create(first_name: "Snake", age: 25, gender: "male", email: "snake@snake.com", password: "123456")
cobra = User.create(first_name: "Cobra", age: 27, gender: "female", email: "cobra@cobra.com", password: "123456")
bob = User.create(first_name: "Bob", age: 30, gender: "male", email: "bob@bob.com", password: "123456")

offer = Offer.create(owner: bob, price: 100, title: "Netlix", description: "Come watch Netflix", rules: "Only TV", city: "Copenhagen")

Match.create(user: snake, offer: offer, start_date: Date.today, end_date: Date.today + 1, status: "pending")
Match.create(user: cobra, offer: offer, start_date: Date.today + 2, end_date: Date.today + 3, status: "pending")

