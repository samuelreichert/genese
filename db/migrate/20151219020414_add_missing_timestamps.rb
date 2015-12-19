class AddMissingTimestamps < ActiveRecord::Migration
  def change
    add_timestamps :categories
    add_timestamps :default_categories
    add_timestamps :entries
  end
end
