class ContactU < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email,:with => Devise::email_regexp
  validates :message, presence: true
end
