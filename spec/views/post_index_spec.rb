require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  describe 'index page' do
    before :each do
      @hanan = User.create(name: 'Hanan', photo: 'profile.jpg', bio: 'Teacher from Mexico.')

      @first_post = Post.create(user_id: @hanan.id, text: '1st post text', title: '1st post title')
      @second_post = Post.create(user_id: @hanan.id, text: '2nd post text', title: '2nd post title')
      @third_post = Post.create(user_id: @hanan.id, text: '3rd post text', title: '3rd post title')

      Comment.create(post_id: @first_post.id, user_id: @hanan.id, text: '1st comment text' )
    end

   feature 'Testing post index page' do
      background { visit user_posts_path(@hanan.id) }

      scenario 'I can see the user\'s profile picture.' do
        expect(page).to have_selector('img')
      end

      scenario 'I can see the user\'s username.' do
        expect(page).to have_content('Hanan')
      end

      scenario 'I can see the number of posts each user has written.' do
        expect(page).to have_content('Number of posts')
      end

      scenario 'I can see a post\'s title.' do
        expect(page).to have_content('1st post title')
      end

      scenario 'I can see some of the post\'s body.' do
        expect(page).to have_content('1st post text')
      end

      scenario 'I can see the first comments on a post.' do
        expect(page).to have_content('1st comment text')
      end

      scenario 'I can see how many comments a post has.' do
        expect(page).to have_content('Comments: 1')
      end

      scenario 'I can see how many likes a post has.' do
        expect(page).to have_content('Likes: 0')
      end

      scenario 'I can see a section for pagination if there are more posts than fit on the view.' do
        expect(page).to have_selector('button')
      end

      scenario 'When I click on a post, it redirects me to that post\'s show page.' do
        click_link '1st post title', match: :first
        expect(current_path).to eql post_path(@hanan.posts.first.id)
      end
    end
  end
end