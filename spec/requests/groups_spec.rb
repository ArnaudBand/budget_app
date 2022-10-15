require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let(:user) do
    usr = User.new(name: 'John Doe', email: 'john@mail.com', password: '123456', password_confirmation: '123456')
    usr.confirm
    usr.save
    return usr
  end

  before(:each) do
    login_as(user)
  end

  after(:each) do
    logout
  end

  describe 'GET /' do
    it 'returns http success' do
      get '/groups'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/groups/new'
      expect(response).to have_http_status(:success)
    end
  end
end
