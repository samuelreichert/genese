class CreateDefaultCategories < ActiveRecord::Migration
  def change
    create_table :default_categories do |t|
      t.string :name
      t.string :color
    end
  end
end
