class StakeHolder < ActiveRecord::Base

  has_many :investments
  belongs_to :town
  belongs_to :address, :dependent => :destroy

  accepts_nested_attributes_for :address


  validates :name, presence: true ,length: {minimum: 3, maximum: 25, message: "length must be greater than 3 and less than 25"}, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "required only alphabet"}
  validates :f_name, presence: true ,length:  {minimum: 3, maximum: 25, message: "length must be greater than 3 and less than 25"}, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "required only alphabet"}
  validates :cnic ,presence: true , uniqueness: {case_sensitive: false},length: { is: 13 , message: "must be conatin 13 number "}, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
end
