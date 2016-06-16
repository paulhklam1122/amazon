# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 100.times do
#   Product.create title: Faker::Beer.name,
#                   description: Faker::Hipster.sentence,
#                   price: Faker::Number.decimal(2)
# end

300.times do
  p = Product.create title:      Faker::Commerce.product_name,
                        description:     Faker::Hipster.paragraph,
                        price: Faker::Number.decimal(2)

  5.times { p.reviews.create star_count: rand(5)} if p.persisted?
end

["Electronics", "Furniture", "Sports", "Automobile", "Stationary"].each do |cat|
  Category.create name: cat
end
