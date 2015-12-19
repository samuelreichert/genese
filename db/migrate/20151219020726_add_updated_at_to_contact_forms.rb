class AddUpdatedAtToContactForms < ActiveRecord::Migration
  def change
    add_column :contact_forms, :updated_at, :datetime
  end
end
