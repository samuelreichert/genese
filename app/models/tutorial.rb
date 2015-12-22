class Tutorial < ActiveRecord::Base
  belongs_to :tutorial_category

  validates_presence_of :title, :description, :tutorial_category_id
end
