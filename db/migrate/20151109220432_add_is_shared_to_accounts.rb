class AddIsSharedToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :is_shared, :boolean, default: false
  end
end
