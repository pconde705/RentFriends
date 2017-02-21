# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = "http://img.clubic.com/07791435-photo-playstation.jpg"
product = Product.new(name: 'Playstation')
product.save!
product.photo_url = url # Upload happens here
