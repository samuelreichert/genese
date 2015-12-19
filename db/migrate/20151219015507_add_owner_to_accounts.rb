class AddOwnerToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :owner, :integer, null: false, default: 0
  end
end
