class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :title, null: false
      t.string :description, null: false, default: ""
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :tutorial_category, index:true
    end

    add_index :tutorials, :title, unique: true
  end
end
