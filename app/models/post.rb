class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :rationale

  scope :with_status, ->(status) { where(status: Post.statuses[status]) }
end
