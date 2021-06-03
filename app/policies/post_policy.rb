class PostPolicy < ApplicationPolicy
  def index?
    ApplicationHelper.is_admin? user
  end

  def update?
    is_allowed?
  end

  def destroy?
    is_allowed?
  end

  private

    def is_allowed?
      (record.user_id == user.id && !record.approved?) || ApplicationHelper.is_admin?(user)
    end
end