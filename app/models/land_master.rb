class LandMaster < ActiveRecord::Base

  belongs_to :address, :dependent => :destroy
  belongs_to :town
  belongs_to :installment, :dependent => :destroy
  has_many :given_installments

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :installment

  validates :name, presence: true,length: {minimum: 3, maximum: 25, message: "length must be greater than 3 and less than 25"}, format: { with:  /\A[a-zA-Z]+\z/, message: "required only alphabet"}
  validates :town_id, presence: true
  validates :f_name, presence: true ,length:  {minimum: 3, maximum: 25, message: "length must be greater than 3 and less than 25"}, format: { with:  /\A[a-zA-Z]+\z/, message: "required only alphabet"}
  validates :cnic, presence: true , uniqueness: {case_sensitive: false},length: { is: 13 , message: "must be conatin 13 number "}, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  after_create :add_payment

  def add_payment
    Payment.create(:amount => self.installment.advance_amount,
                   :date => self.created_at,
                   :land_master_id => self.id,
                   :town_id => self.town_id,
                   :payment_type => 'withdraw',
                   :payment_status => 'advance'
    )
  end

end
