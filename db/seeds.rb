# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"


puts "Detroying all Favorite, Beer, Recipe, Shop"
Favorite.destroy_all
Beer.destroy_all
Recipe.destroy_all
Shop.destroy_all

puts "Create some Beer, Recipe, Shop..."

# Beer.create!(brewery: 'Brussels Beer Project', name: 'Delta IPA', color: 'Ambrée', style: 'Belgian IPA', alcohol_level: '6,00', ibu_level: '45', country: 'Belgique', tag_list: 'charcuterie, fast-food, volaille, canard, pâté, plat épicé, fruit de mer, fromage à pâte dure, fromage persillé, abat, caramel, crème fraîche, poisson gras')
# Beer.create!(brewery: 'Hoegaarden', name: 'Wit-Blanche', color: 'Blanche', style: 'Witbier', alcohol_level: '4,90', ibu_level: '15', country: 'Belgique', tag_list: 'crudité, fruit, crustacé, fruit de mer, fromage frais, poulet, poisson, carpaccio, ceviche, légume')
# Beer.create!(brewery: 'Peak Beer', name: 'Peak Blonde', color: 'Blonde', style: 'Blonde Ale', alcohol_level: '6,00', ibu_level: '28', country: 'Belgique', tag_list: 'charcuterie, poisson, hamburger, plat épicé, poulet, veau, salade, fromage à pâte molle, fromage frais, fromage à pâte dure, dessert, fruit, légume')
# Beer.create!(brewery: 'Abbaye de Leffe', name: 'Leffe Brune', color: 'Brune', style: 'Brown Ale', alcohol_level: '6,50', ibu_level: '20', country: 'Belgique', tag_list: 'charcuterie, barbecue, viande, volaille, porc, gibier, poisson, pizza, fromage persillé, chocolat, tiramisu, caramel, passion, porc, plat mijoté')
# Beer.create!(brewery: 'Brasserie Lindemans', name: 'Kriek', color: 'Fruitée', style: 'Lambic', alcohol_level: '3,50', ibu_level: '18', country: 'Belgique', tag_list: 'crudité, légume, fast-food, fruit, fromage frais, fromage à pâte molle, poisson, gibier, plat mijoté')
# Beer.create!(brewery: 'NovaBirra', name: 'Big Mama', color: 'Noire', style: 'Belgian Cacao Stout', alcohol_level: '8,00', ibu_level: '42', country: 'Belgique', tag_list: 'gibier, agneau, volaille, fruit de mer, fromage persillé, noix de coco, amande grillée, fruit rouge, spéculoos, plat mijoté, tiramisu')

Recipe.create!(name: 'Pumpkin Pie', description: 'A delicious pumpkin pie', photo: 'https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/05/pumpkin-pie.jpg?itok=_XZqYlzp', aliment_type: 'Dessert', difficulty_level: 'Facile', prep_time: '30', tag_list: 'sucré')
Recipe.create!(name: 'Poulet pané au parmesan', description: 'A delicious recipe', photo: 'https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/05/pumpkin-pie.jpg?itok=_XZqYlzp', aliment_type: 'Viande', difficulty_level: 'Facile', prep_time: '30', tag_list: 'viande')
Recipe.create!(name: 'Homard au beure', description: 'A delicious recipe', photo: 'https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/05/pumpkin-pie.jpg?itok=_XZqYlzp', aliment_type: 'Crustacé', difficulty_level: 'Facile', prep_time: '30', tag_list: 'crustacé')
Recipe.create!(name: 'Truite', description: 'A delicious recipe', photo: 'https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/05/pumpkin-pie.jpg?itok=_XZqYlzp', aliment_type: 'Poisson', difficulty_level: 'Facile', prep_time: '30', tag_list: 'poisson')

#shop = Shop.create!(name: 'Caverne de la biére', address: '1 rue de la Republique, 74000 Annecy')
#shop = Shop.create!(name: 'Taverne du baron', address: '92 rue Maubec, 64100 Bayonne')
#shop = Shop.create!(name: 'La riviere de la binouse', address: '25 rue Georges Lassalle, 64340 Boucau')
#shop = Shop.create!(name: 'VnB', address: '25 avenue Jean Leon Laporte, 64600 Anglet')


# filepath = "db/shops.json"
# database_shops = File.read(filepath)
# shops = JSON.parse(database_shops)

# puts "Creating shops, beers..."
# shops.each do |shop|
#   Shop.create(name: shop["name"], address: shop["address"])
# end
# puts "Shops created !"



filepath = "db/beers.csv"

CSV.foreach(filepath, headers: :first_row) do |row|
  Beer.create(
    name: row['name'],
    brewery: row['brewery'],
    color: row['color'],
    style: row['style'],
    alcohol_level: row['alcohol_level'],
    ibu_level: row['ibu_level'],
    country: row['beer_country'],
    description: row['beer_description'],
    tag_list: row['tag_list'],
    photo: row['photo'],
    photo_path: row['photo_path'],
  )
end
  puts "Beers created !"


# filepath = "db/recipes.csv"

# CSV.foreach(filepath, headers: :first_row) do |row|
#   Beer.create(
#     name: row['name'].strip
#     ...: row['']
#   )
#   p row['name']
# end
