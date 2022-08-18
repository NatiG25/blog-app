class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, foreign_key: :post_id

  # scope :update_post, -> {users.}
  # scope :recent_comments, -> {comments.limit(5).order(created_at: :desc)}
end
