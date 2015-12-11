class Entry < ActiveRecord::Base
  belongs_to :account
  belongs_to :category

  enum entries_type: { income: "income", expense: "expense" }
  enum repeat_frequency: [:yearly, :biannual, :quarterly, :bimonthly, :monthly, :fortnightly, :weekly, :daily]
end
