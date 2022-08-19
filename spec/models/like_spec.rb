require 'rails_helper'

RSpec.describe Like, type: :model do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.create(user: user, title: 'Hello', text: 'This is my first post')
    like = Like.create(post_id: post.id, user_id: user.id )

  it 'user should be present' do
    like.post = nil
    expect(like).to_not be_valid
  end

  it 'user should be present' do
    like.user = nil
    expect(like).to_not be_valid
  end
end
