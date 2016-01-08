# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# Create Default Categories
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

# Create test User
user = User.create!(email: 'teste@teste.com', password: 'teste1234', password_confirmation: 'teste1234', name: 'Teste', birth_date: '01/01/1990')

# Create test Account
account = user.accounts.create!(reminder_days_before: 3, reminder_active: true, name: "Conta Privada - #{user.name}", owner: user.id)
user.update(main_account: account.id)

# Create categories for test
DefaultCategory.find_each do |category|
  account.categories.create(category.attributes.except('id'))
end
