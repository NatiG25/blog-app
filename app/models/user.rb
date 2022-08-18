class User < ApplicationRecord
    has_many :posts
    # has_many :comments, class_name: 'Comment'
    # has_many :likes, class_name: 'Like'
    def most_recent
        posts.limit(3).order(created_at: :desc)
    end
end
