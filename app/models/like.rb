class Like < ApplicationRecord
  validates :post, presence: true
  validates :user, presence: true
  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id

  after_save :update_like

  def update_like
    post.increment!(:likes_counter)
  end
end
