class Order < ApplicationRecord
  enum payment_option: {
    postpay: 0,
    prepay_full: 1,
    prepay_half: 2
  }
  belongs_to :user, optional: true
  validates :phone_number, phone: { allow_blank: true }
  monetize :amount_cents
end
