require 'rails_helper'

RSpec.describe 'Entities', type: :request do
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

  let(:group) do
    grp = Group.new(name: 'Group 1', icon: '✈️', user_id: user.id)
    grp.save
    return grp
  end
  subject(:entity) { Entity.create(name: 'beets', amount: 250, user_id: user.id, group_id: group.id) }

  describe 'GET /new' do
    it 'returns http success' do
      get new_group_entity_path(group.id)
      expect(response).to have_http_status(:success)
    end
  end
end
