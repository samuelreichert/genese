class ChangeMessageStringToTextFromContactForm < ActiveRecord::Migration
  def up
    change_table :contact_forms do |t|
      t.change :message, :text
    end
  end

  def down
    change_table :contact_forms do |t|
      t.change :message, :string
    end
  end
end
