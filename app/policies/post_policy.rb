class PostPolicy < ApplicationPolicy
  def index?
    admin_types.include?(user.type)
  end

  def update?
    is_allowed?
  end

  def destroy?
    is_allowed?
  end

  private

    def is_allowed?
      (record.user_id == user.id && !record.approved?) || admin_types.include?(user.type)
    end
end