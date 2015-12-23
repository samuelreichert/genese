class TutorialCategory < ActiveRecord::Base
  has_many :tutorials

  validates :name, presence: true
end
