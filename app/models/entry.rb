class Entry < ActiveRecord::Base
  extend Enumerize
  belongs_to :account
  belongs_to :category

  enumerize :type, in: [:income, :expense]
  enumerize :repeat_frequency, in: [:yearly, :biannual, :quarterly, :bimonthly, :monthly, :fortnightly, :weekly, :daily]
end
