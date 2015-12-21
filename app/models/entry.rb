class Entry < ActiveRecord::Base
  belongs_to :account
  belongs_to :category

  enum entries_type: { income: "income", expense: "expense" }
  enum repeat_frequency: [:years, :months, :weeks, :days]

  validates_presence_of :entries_type, :description, :date, :value, :account_id, :category_id
end
