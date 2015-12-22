class TutorialCategory < ActiveRecord::Base
  has_many :tutorials

  validates_presence_of :name
end
