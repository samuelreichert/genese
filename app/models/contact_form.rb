class ContactForm < ActiveRecord::Base
  validates :email, :message, presence: true
end
