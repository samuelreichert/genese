class Account < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :categories
  has_many :entries

  enum currency_type: { dollar: "$", euro: "€", real: "R$" }
  enum entries_order: { crescent: true, decrescent: false }
end
