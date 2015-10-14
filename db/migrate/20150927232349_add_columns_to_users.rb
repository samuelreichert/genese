class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, default: "", null: false
    add_column :users, :picture, :string
    add_column :users, :birth_date, :datetime
  end
end
