class PostPolicy < ApplicationPolicy
  def index?
    admin_types.include?(user.type)
  end

  def update?
    record.user_id == user.id || admin_types.include?(user.type)
  end

  def destroy?
    record.user_id == user.id || admin_types.include?(user.type)
  end
end