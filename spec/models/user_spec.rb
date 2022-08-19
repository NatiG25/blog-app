require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')}

  before {subject.save}

  it 'present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'length' do
    subject.director = 'a'
    expect(subject).to_not be_valid
  end

  it 'length' do
    subject.title = 'a' * 30
    expect(subject).to_not be_valid
  end

  it 'rate' do
    subject.rate = -1
    expect(subject).to be_valid
  end
end
