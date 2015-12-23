class DefaultCategory < ActiveRecord::Base
  validates :name, :color, presence: true
end
