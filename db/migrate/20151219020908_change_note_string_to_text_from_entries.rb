class ChangeNoteStringToTextFromEntries < ActiveRecord::Migration
  def up
    change_table :entries do |t|
      t.change :note, :text
    end
  end

  def down
    change_table :entries do |t|
      t.change :note, :string
    end
  end
end
