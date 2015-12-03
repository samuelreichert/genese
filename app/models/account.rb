class Account < ActiveRecord::Base
  extend Enumerize

  has_and_belongs_to_many :users
  has_many :categories
  has_many :entries

  enum currency_type: [ :dollar, :euro, :real ]
end
