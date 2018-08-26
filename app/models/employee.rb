class Employee < ActiveRecord::Base

  belongs_to :town
  belongs_to :address

  accepts_nested_attributes_for :address

  validates :name, presence: true,length: {minimum: 3, maximum: 25, message: "length must be greater than 3 and less than 25"}, format: { with:  /\A[a-zA-Z]+\z/, message: "required only alphabet"}
  validates :f_name, presence: true,length: {minimum: 3, maximum: 25, message: "length must be greater than 3 and less than 25"}, format: { with:  /\A[a-zA-Z]+\z/, message: "required only alphabet"}
  validates :cnic ,presence: true ,length: { is: 13 , message: "must be conatin 13 number "}, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  validates :town_id, presence: true
  validates :salary,presence: true , numericality: { only_integer: true , message: "Integer only"}
end
