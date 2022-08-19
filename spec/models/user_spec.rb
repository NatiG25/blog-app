require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'photo should be present' do
    user.photo = nil
    expect(user).to_not be_valid
  end

  it 'bio should be present' do
    user.bio = nil
    expect(user).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end
end
