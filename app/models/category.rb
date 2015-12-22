class Category < ActiveRecord::Base
  belongs_to :account
  has_many :entries

  validates_presence_of :name, :color, :account_id
end
