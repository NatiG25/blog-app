require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'index page' do
    before :each do
      @tom = User.create(name: 'Tom', photo: 'profile.jpg', bio: 'Developer.')
      @peter = User.create(name: 'Peter', photo: 'profile.jpg', bio: 'Web Developer.')
    end

    feature 'Testing user index page' do
      background { visit users_path }

      scenario 'I can see the username of all other users.' do
        expect(page).to have_content('Tom')
        expect(page).to have_content('Peter')
      end

      scenario 'I can see the profile picture for each user.' do
        expect(page).to have_selector('img')
      end

      scenario 'I can see the number of posts each user has written.' do
        expect(page).to have_content('Number of posts')
      end

      scenario 'When I click on a user, I am redirected to that user\'s show page.' do
        click_link 'Tom', match: :first
        expect(current_path).to eql user_path(User.first.id)
      end
    end
  end
end
