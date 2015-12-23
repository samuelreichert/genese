class Category < ActiveRecord::Base
  belongs_to :account
  has_many :entries

  validates :name, :color, :account_id, presence: true
end
