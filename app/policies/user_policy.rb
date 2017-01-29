class UserPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def signup?
    true
  end

  def destroy?
    admin? && @user.id != @record.id
  end
end
