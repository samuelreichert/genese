class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.boolean :entries_order, default: false
      t.string :currency_type, default: "R$", null: false
      t.integer :reminder_days_before, default: 0
      t.boolean :reminder_active, default: false
      t.decimal :total_balance, precision: 11, scale: 2
      t.decimal :total_expenditure, precision: 11, scale: 2
    end
  end
end
