class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def update_post 
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
