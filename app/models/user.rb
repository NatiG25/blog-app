class User < ApplicationRecord
    has_many :posts
    # has_many :comments, class_name: 'Comment'
    # has_many :likes, class_name: 'Like'
    def recent_post
        posts.limit(3).order(created_at: :desc)
    end
end
