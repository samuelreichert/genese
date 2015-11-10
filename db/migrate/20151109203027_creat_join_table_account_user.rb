class CreatJoinTableAccountUser < ActiveRecord::Migration
  def change
    create_join_table :accounts, :users

    add_index :accounts_users, [:account_id, :user_id]

    add_foreign_key :accounts_users, :accounts
    add_foreign_key :accounts_users, :users
  end
end
