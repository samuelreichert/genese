class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|
      t.string :email, null: false, default: ""
      t.string :message, null: false, default: ""
      t.datetime :created_at
      t.boolean :readed
    end
  end
end
