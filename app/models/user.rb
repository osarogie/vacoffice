class User < ApplicationRecord
  enum level: { customer: 0, dispatch: 1, admin: 2, super_admin: 3 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :trackable, :omniauthable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenyListing
  validates :phone_number, phone: { allow_blank: true }
  has_many :orders, dependent: :destroy
  has_paper_trail

  def display_name
    full_name || email
  end
end
