class Order < ApplicationRecord
  enum payment_option: {
    postpay: 0,
    prepay_full: 1,
    prepay_half: 2
  }
  belongs_to :user, optional: true
  validates :sender_phone, phone: { allow_blank: true }
  validates :recipient_phone, phone: { allow_blank: true }
  validates :rrn, presence: true
  monetize :amount_cents
  before_validation :generate_rrn

  protected
  def generate_rrn
    begin
      self.rrn = SecureRandom.random_number(100000000)
    end until(!Order.where(rrn: rrn).exists?)
  end
end
