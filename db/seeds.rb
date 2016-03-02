# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

anais = User.create(first_name: "Anais", last_name: "Corinne", birthday: "1988-12-20", email: "anaiscorinne@gmail.com", password: "heyheyhey", password_confirmation: "heyheyhey", role: "admin")

keyvalues = Keyvalue.create([{name: "Eco-Sourcing", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", icon: "orange-text text-lighten-4 mdi mdi-terrain"}, 
														 {name: "Vintage", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", icon: " pink-text text-lighten-3 mdi mdi-sync"}, 
														 {name: "Cruelty-Free", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", icon: "brown-text text-lighten-3 mdi mdi-cow"}, 
														 {name: "Recycled", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", icon: "green-text text-lighten-3 mdi mdi-recycle"}, 
														 {name: "Organic", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", icon: "cyan-text text-lighten-4 mdi mdi-earth"}, 
														 {name: "Profits Charity", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", icon: "indigo-text text-lighten-4 mdi mdi-gift"}, 
														 {name: "Fair-Trade", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", icon: " deep-orange-text text-lighten-3 mdi mdi-tag-faces"}, 
														 {name: "Locally-Made", description: "Lorem ipsum dolor sit amet, consectetur adipiscing...", icon: "purple-text text-lighten-3 mdi mdi-airplane-off"}])