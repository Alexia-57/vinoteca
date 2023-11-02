# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# DEFAULT COUNTRIES

# Destroy existing records of wines first
puts "Destroying existing records of Wines..."
Wine.destroy_all # if Rails.env.development?
puts "Done deleting Wines..."

# Destroy existing records of regions after wines
puts "Destroying existing records of Regions..."
Region.destroy_all # if Rails.env.development?
puts "Done deleting Regions..."

# Destroy existing records of countries after regions
puts "Destroying existing records of Countries..."
Country.destroy_all # if Rails.env.development?
puts "Done deleting Countries..."

# Create a new list of unique countries
countries = ["France", "Italie", "Espagne", "États-Unis", "Argentine", "Chili", "Australie", "Afrique du Sud", "Allemagne", "Portugal", "Nouvelle-Zélande", "Japon"]
sorted_countries = countries.uniq.sort  # Remove duplicates and sort alphabetically

sorted_countries.each do |country_name|
  Country.create(name: country_name)
end

# Find or create regions and countries based on their names (instances, not strings)
japon = Country.find_or_create_by(name: 'Japon')
nagano = Region.find_or_create_by(name: 'Nagano', country: japon)
france = Country.find_or_create_by(name: 'France')
bourgogne = Region.find_or_create_by(name: 'Bourgogne', country: france)
bordeaux = Region.find_or_create_by(name: 'Bordeaux', country: france)

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
  region: nagano,
  winery: 'St Cousair',
  variety: 'Cabernet Sauvignon',
  country: japon,
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
  region: bourgogne,
  winery: 'Inconnue',
  variety: 'Beaujolais Nouveau',
  country: france,
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
  region: bordeaux,
  winery: 'Le Petit Clocher',
  variety: 'Chardonnay',
  country: france,
  year: 2018,
  quantity: 1,
  rating: 4.5,
  comment: 'Accompagne bien les fruits de mer',
  empty: false,
  user_id: user1.id
)
