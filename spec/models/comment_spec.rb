require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  post = Post.create(user: user, title: 'Hello', text: 'This is my first post')
  comment = Comment.create(post_id: post.id, user_id: user.id, text: 'Hi Tom!')

  it 'user should be present' do
    comment.post = nil
    expect(comment).to_not be_valid
  end

  it 'user should be present' do
    comment.user = nil
    expect(comment).to_not be_valid
  end

  it 'text should be present' do
    comment.text = nil
    expect(comment).to_not be_valid
  end
end
