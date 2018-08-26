class Installment < ActiveRecord::Base

  belongs_to :town

  validates :total_amount, presence: true , numericality: { only_integer: true , message: "Integer only"}
  validates :advance_amount, presence: true , numericality: { only_integer: true , message: "Integer only"}
  validates :total_number_of_installments, numericality: { only_integer: true , message: "Integer only"}
  # validates :per_installments_amount, presence: true
  validates :installment_type, presence: true , numericality: { only_integer: true , message: "Integer only"}

end
