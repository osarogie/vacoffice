class DeliveryPackage < ApplicationRecord
  enum status: {
    pending: 0,
    assigned: 1,
    dispatched: 2,
    delivered: 3,
  }
  belongs_to :order
  validates :recipient_phone, phone: { allow_blank: true }
end
