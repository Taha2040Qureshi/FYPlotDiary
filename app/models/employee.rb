class Employee < ActiveRecord::Base

  belongs_to :town
  belongs_to :address

  accepts_nested_attributes_for :address

  validates :name, presence: true, length: {minimum: 3, maximum: 25}
  validates :f_name, presence: true,length: {minimum: 3, maximum: 25}
  validates :cnic ,presence: true , uniqueness: {case_sensitive: false},length: { is: 15} 
  validates :town_id, presence: true
  validates :salary, presence: true
end
