require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  describe 'show page' do
    before :each do
      @hanan = User.create(name: 'Hanan', photo: 'profile.jpg', bio: 'Teacher from Mexico.')

      @first_post = Post.create(user_id: @hanan.id, text: '1st post text', title: '1st post title')

      Comment.create(post_id: @first_post.id, user_id: @hanan.id, text: '1st comment text' )
    end

   feature 'Testing post show page' do
      background { visit post_path(@hanan.posts.first.id) }

      scenario 'I can see a post\'s title.' do
        expect(page).to have_content('1st post title')
      end

      scenario 'I can see who wrote the post.' do
        expect(page).to have_content('by Hanan')
      end

      scenario 'I can see how many comments it has.' do
        expect(page).to have_content('Comments: 1')
      end

      scenario 'I can see how many likes it has.' do
        expect(page).to have_content('Likes: 0')
      end

      scenario 'I can see the post body.' do
        expect(page).to have_content('1st post text')
      end

      scenario 'I can see the username of each commentor & I can see the comment each commentor left.' do
        expect(page).to have_content('Hanan: 1st comment text')
      end
    end
  end
end