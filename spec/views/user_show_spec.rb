require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'show page' do
    before :each do
      @hanan = User.create(name: 'Hanan', photo: 'profile.jpg', bio: 'Teacher from Mexico.')

      @first_post = Post.create(user_id: @hanan.id, text: '1st post text', title: '1st post title')
      @second_post = Post.create(user_id: @hanan.id, text: '2nd post text', title: '2nd post title')
      @third_post = Post.create(user_id: @hanan.id, text: '3rd post text', title: '3rd post title')
    end

   feature 'Testing user show page' do
      background { visit user_path(@hanan.id) }

      scenario 'I can see the user\'s profile picture.' do
        expect(page).to have_selector('img')
      end

      scenario 'I can see the user\'s username.' do
        expect(page).to have_content('Hanan')
      end

      scenario 'I can see the number of posts each user has written.' do
        expect(page).to have_content('Number of posts')
      end

      scenario 'I can see the user\'s bio.' do
        expect(page).to have_content('Bio')
      end

      scenario 'I can see the user\'s first 3 posts.' do
        expect(page).to have_content('1st post title')
        expect(page).to have_content('2nd post title')
        expect(page).to have_content('3rd post title')
      end

      scenario 'I can see a button that lets me view all of a user\'s posts.' do
        expect(page).to have_selector('button')
      end

      scenario 'When I click a user\'s post, it redirects me to that post\'s show page.' do
        click_link '1st post title', match: :first
        expect(current_path).to eql post_path(@hanan.posts.first.id)
      end

      scenario 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
        click_link 'See all posts', match: :first
        expect(current_path).to eql user_posts_path(@hanan.id)
      end
    end
  end
end