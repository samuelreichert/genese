class ChangeTextForDescription < ActiveRecord::Migration
  def up
    change_table :tutorials do |t|
      t.change :description, :text
    end
  end

  def down
    change_table :tutorials do |t|
      t.change :description, :string
    end
  end
end
