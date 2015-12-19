class RemoveColumnsFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :total_balance, :decimal, precision: 11, scale: 2
    remove_column :accounts, :total_expenditure, :decimal, precision: 11, scale: 2
  end
end
