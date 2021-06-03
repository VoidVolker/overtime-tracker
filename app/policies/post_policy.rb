class PostPolicy < ApplicationPolicy
  def index?
    Admin.is? user
  end

  def update?
    is_allowed?
  end

  def destroy?
    is_allowed?
  end

  private

    def is_allowed?
      (record.user_id == user.id && !record.approved?) || Admin.is?(user)
    end
end