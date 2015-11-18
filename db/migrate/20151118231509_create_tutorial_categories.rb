class CreateTutorialCategories < ActiveRecord::Migration
  def change
    create_table :tutorial_categories do |t|
      t.string :name
    end
  end
end
