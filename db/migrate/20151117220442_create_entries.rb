class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :type, null: false
      t.string :description, null: false, default: ""
      t.string :note
      t.date :date
      t.decimal :value, null: false, precision: 11, scale: 2
      t.boolean :paid
      t.boolean :repeat
      t.integer :repeat_times
      t.string :repeat_frequency
      t.belongs_to :account, index:true
      t.belongs_to :category, index:true
    end
  end
end
