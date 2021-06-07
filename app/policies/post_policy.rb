class PostPolicy < ApplicationPolicy
  def index?
    ApplicationController.is_admin? user
  end

  def update?
    is_allowed?
  end

  def destroy?
    is_allowed?
  end

  def approve?
    ApplicationController.is_admin? user
  end

  private

    def is_allowed?
      (record.user_id == user.id && !record.approved?) || ApplicationController.is_admin?(user)
    end
end