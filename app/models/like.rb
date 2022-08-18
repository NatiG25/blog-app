class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_like
    post.increment!(:likes_counter)
  end
end
