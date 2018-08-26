class Address < ActiveRecord::Base

   validates :address_1, presence: true
  validates :phone_number1, presence: true ,length: { is: 10 , message: "must be conatin 10 number "}, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
end
