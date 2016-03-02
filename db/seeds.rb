# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

anais = User.create(first_name: "Anais", last_name: "Corinne", birthday: "1988-12-20", email: "anaiscorinne@gmail.com", password: "heyheyhey", password_confirmation: "heyheyhey", role: "admin")