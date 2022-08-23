require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  it 'tests post index' do
    get '/users/show/posts'

    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('This is a list of all the posts in the app.')
  end

  it 'tests post show' do
    get '/users/show/posts/show'

    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('This is a list of all the posts for a specific user.')
  end
end
