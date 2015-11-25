class Account < ActiveRecord::Base
  extend Enumerize

  has_and_belongs_to_many :users
  has_many :categories
  has_many :entries

  CURRENCIES = { dollar: "US$", euro: "€", real: "R$" }
  enumerize :currency_type, in: CURRENCIES, scope: true
end
