class RenameIsSharedToPublic < ActiveRecord::Migration
  def change
    rename_column :accounts, :is_shared, :public
  end
end
