class AddMainAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :main_account, :integer
  end
end
