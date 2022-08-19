require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { Movie.new(title: 'helloee', director: 'smith', rate: -8)}

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
