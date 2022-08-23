require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'tests user index' do
    get '/users'

    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('This is a list of all the user in the app.')
  end

  it 'tests user show' do
    get '/users/show'

    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('Here are the details of the selected user.')
  end
end
