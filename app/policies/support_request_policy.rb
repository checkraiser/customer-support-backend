class SupportRequestPolicy < ApplicationPolicy
  def index?
    support_agent? || customer?
  end

  def unfiltered_search?
    support_agent?
  end

  def show?
    support_agent? || own_request?
  end

  def create?
    customer?
  end

  def update?
    support_agent? && own_request?
  end

  private

  def own_request?
    @record.user_id&.eql?(@user.id)
  end
end
