class ChangeEntriesType < ActiveRecord::Migration
  def up
    rename_column :entries, :type, :entries_type
  end

  def down

  end
end
