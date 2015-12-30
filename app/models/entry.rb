class Entry < ActiveRecord::Base
  include PgSearch
  belongs_to :account
  belongs_to :category

  pg_search_scope :search_by_description, against: :description, using: {tsearch: {dictionary: "portuguese", prefix: true}}
  enum entries_type: { income: "income", expense: "expense" }
  enum repeat_frequency: [:years, :months, :weeks, :days]

  validates :entries_type, :description, :date, :value, :account_id, :category_id, presence: true
end
