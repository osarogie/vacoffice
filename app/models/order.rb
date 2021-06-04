class Order < ApplicationRecord
  enum payment_option: {
    post_pay: 0,
    prepay_full: 1,
    prepay_half: 2,
  }
  belongs_to :user, optional: true
  has_many :delivery_packages, dependent: :destroy
  validates :sender_phone, phone: { allow_blank: true }
  validates :rrn, presence: true
  monetize :amount_cents
  before_validation :generate_rrn

  protected

  def generate_rrn
    loop do
      self.rrn = SecureRandom.random_number(100000000)
      break unless Order.where(rrn: rrn).exists?
    end
  end
end
