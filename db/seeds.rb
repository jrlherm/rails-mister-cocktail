# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require "rest-client"

response = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
repos = JSON.parse(response)
# => repos is an `Array` of `Hashes`.

p 'Creating ingredients'
p '-' * 30
repos["drinks"].each do |element|
  Ingredient.create(name: element["strIngredient1"])
  p "Created #{element['strIngredient1']}"
end
p 'Finished'
