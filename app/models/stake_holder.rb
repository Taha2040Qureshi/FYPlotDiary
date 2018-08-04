class StakeHolder < ActiveRecord::Base

  has_many :investments
  belongs_to :town
  belongs_to :address, :dependent => :destroy

  accepts_nested_attributes_for :address


  validates :name, presence: true ,length: {minimum: 3, maximum: 25}
  validates :f_name, presence: true ,length: {minimum: 3, maximum: 25}
  validates :cnic ,presence: true , uniqueness: {case_sensitive: false},length: { is: 15} 

end
