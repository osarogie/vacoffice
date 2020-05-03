class AdminAbility
  include CanCan::Ability
  def initialize(user)
    return if user&.customer?
    can :access, :rails_admin
    can :manage, :all if user&.super_admin?
  end
end
