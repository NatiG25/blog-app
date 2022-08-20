class Comment < ApplicationRecord
  validates :post, presence: true
  validates :user, presence: true
  validates :text, presence: true
  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id

  def update_comment
    post.increment!(:comments_counter)
  end
end
