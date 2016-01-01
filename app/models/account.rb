class Account < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :entries, dependent: :destroy
  has_many :categories, dependent: :destroy

  enum currency_type: { dollar: "en", euro: "es", real: "pt-BR" }
  enum entries_order: { crescent: true, decrescent: false }

  validates :currency_type, :name, :owner, presence: true
end
