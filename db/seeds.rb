# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Wine.create(
  name: 'Château Abc',
  wine_type: 'Rouge',
  region: 'Nagano',
  winery: 'St Cousair',
  variety: 'Cabernet Sauvignon',
  year: 2019,
  quantity: 2,
  rating: 2.5,
  comment: 'Vin un peu acide',
  empty: false
)

Wine.create(
  name: 'Le Père La Grolle',
  wine_type: 'Rouge',
  region: 'Bourgogne',
  winery: 'Inconnue',
  variety: 'Beaujolais Nouveau',
  year: 2020,
  quantity: 3,
  rating: 3.5,
  comment: 'Très fruité',
  empty: false
)

Wine.create(
  name: 'Entre Deux Mers',
  wine_type: 'Blanc',
  region: 'Bordeaux',
  winery: 'Le Petit Clocher',
  variety: 'Chardonnay',
  year: 2018,
  quantity: 1,
  rating: 4.5,
  comment: 'Accompagne bien les fruits de mer',
  empty: false
)
