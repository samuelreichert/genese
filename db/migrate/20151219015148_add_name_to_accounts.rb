class AddNameToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :name, :string, null: false, default: ""
  end
end
