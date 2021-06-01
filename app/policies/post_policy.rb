class PostPolicy < ApplicationPolicy
  def index?
    is_admin?
  end

  def update?
    is_allowed?
  end

  def destroy?
    is_allowed?
  end

  private

    def is_allowed?
      (record.user_id == user.id && !record.approved?) || is_admin?
    end
end