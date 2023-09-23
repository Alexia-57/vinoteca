# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Wine.create(
  name: 'Sample Wine 1',
  type: 'Red',
  region: 'Napa Valley',
  winery: 'Sample Winery 1',
  variety: 'Cabernet Sauvignon',
  year: 2019,
  quantity: 5,
  rating: 4,
  comment: 'A great wine for special occasions.',
  empty: false
)

Wine.create(
  name: 'Sample Wine 2',
  type: 'White',
  region: 'Bordeaux',
  winery: 'Sample Winery 2',
  variety: 'Chardonnay',
  year: 2020,
  quantity: 3,
  rating: 3,
  comment: 'Light and refreshing.',
  empty: false
)
