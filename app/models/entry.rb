class Entry < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  # TODO - create enums
end
