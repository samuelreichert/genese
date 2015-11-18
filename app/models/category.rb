class Category < ActiveRecord::Base
  belongs_to :account
  has_many :entries
end
