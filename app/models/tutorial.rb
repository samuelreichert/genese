class Tutorial < ActiveRecord::Base
  belongs_to :tutorial_category

  validates :title, :description, :tutorial_category_id, presence: true
end
