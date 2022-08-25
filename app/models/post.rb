class Post < ApplicationRecord
  # validates :title, presence: true, length: { maximum: 250 }
  # validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  # validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :user, foreign_key: :user_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  def update_post
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
