# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# DEFAULT COUNTRIES

countries = ["France", "Italie", "Espagne", "États-Unis", "Argentine", "Chili", "Australie", "Afrique du Sud", "Allemagne", "Portugal", "Nouvelle-Zélande", "Grèce", "Hongrie", "Autriche", "Roumanie", "Bulgarie", "Croatie", "Slovénie", "Géorgie", "Canada", "Japon", "Inde"]
sorted_countries = countries.sort

sorted_countries.each do |country_name|
  Country.create(name: country_name)
end

# SEEDS FOR WINE EXAMPLES
puts "Destroying existing records of Wines..."

Wine.destroy_all # if Rails.env.development?

puts "Done deleting.."

# Find or create users
user1 = User.find_or_create_by(email: 'alexia@example.com') do |user|
  user.encrypted_password = 'password1'
end

user2 = User.find_or_create_by(email: 'user2@example.com') do |user|
  user.encrypted_password = 'password2'
end

puts "Creating new wines..."

Wine.create(
  name: 'Château Abc',
  wine_type: 'Rouge',
  region: 'Nagano',
  winery: 'St Cousair',
  variety: 'Cabernet Sauvignon',
  country: 'Japon',
  year: 2019,
  quantity: 2,
  rating: 2.5,
  comment: 'Vin un peu acide',
  empty: false,
  user_id: user1.id
)

Wine.create(
  name: 'Le Père La Grolle',
  wine_type: 'Rouge',
  region: 'Bourgogne',
  winery: 'Inconnue',
  variety: 'Beaujolais Nouveau',
  country: 'France',
  year: 2020,
  quantity: 3,
  rating: 3.5,
  comment: 'Très fruité',
  empty: false,
  user_id: user1.id
)

Wine.create(
  name: 'Entre Deux Mers',
  wine_type: 'Blanc',
  region: 'Bordeaux',
  winery: 'Le Petit Clocher',
  variety: 'Chardonnay',
  country: 'France',
  year: 2018,
  quantity: 1,
  rating: 4.5,
  comment: 'Accompagne bien les fruits de mer',
  empty: false,
  user_id: user1.id
)
