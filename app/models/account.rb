class Account < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :categories
  has_many :entries
end
