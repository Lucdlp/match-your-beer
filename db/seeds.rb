# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Detroying all beers"
Beer.destroy_all

puts "Create some beers..."

beer = Beer.create!(brewery: 'Brussels Beer Project', name: 'Delta IPA', color: 'Ambrée', style: 'Belgian IPA', alcohol_level: '6,00', ibu_level: '45', country: 'Belgique')

beer = Beer.create!(brewery: 'Hoegaarden', name: 'Wit-Blanche', color: 'Blanche', style: 'Witbier', alcohol_level: '4,90', ibu_level: '15', country: 'Belgique')

beer = Beer.create!(brewery: 'Peak Beer', name: 'Peak Blonde', color: 'Blonde', style: 'Blonde Ale', alcohol_level: '6,00', ibu_level: '28', country: 'Belgique')

beer = Beer.create!(brewery: 'Abbaye de Leffe', name: 'Leffe Brune', color: 'Brune', style: 'Brown Ale', alcohol_level: '6,50', ibu_level: '20', country: 'Belgique')

beer = Beer.create!(brewery: 'Brasserie Lindemans', name: 'Kriek', color: 'Fruitée', style: 'Lambic', alcohol_level: '3,50', ibu_level: '18', country: 'Belgique')

beer = Beer.create!(brewery: 'NovaBirra', name: 'Big Mama', color: 'Noire', style: 'Belgian Cacao Stout', alcohol_level: '8,00', ibu_level: '42', country: 'Belgique')

recipe = Recipe.create!(name: 'Pumpkin Pie', description: 'A delicious pumpkin pie', photo: 'https://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe/recipe-image/2016/05/pumpkin-pie.jpg?itok=_XZqYlzp', aliment_type: 'Dessert', difficulty_level: 'Facile', prep_time: '30')

puts "Beers created!"
