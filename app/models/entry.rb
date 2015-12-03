class Entry < ActiveRecord::Base
  extend Enumerize
  belongs_to :account
  belongs_to :category

  enum entries_type: [:income, :expense]
  enum repeat_frequency: [:yearly, :biannual, :quarterly, :bimonthly, :monthly, :fortnightly, :weekly, :daily]
end
