# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

default_categories_list = [
  ['Alimentação', '#f1c40f'],
  ['Educação', '#27ae60'],
  ['Lazer', '#3498db'],
  ['Outros', '#000000'],
  ['Salário', '#76e46d'],
  ['Transporte', '#95a5a6'],
  ['Viagem', '#e74c3c']
]

default_categories_list.each do |name, color|
  DefaultCategory.create( name: name, color: color )
end

