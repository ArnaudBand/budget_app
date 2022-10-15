require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) do
    usr = User.new(name: 'John Doe', email: 'john@mail.com', password: '123456', password_confirmation: '123456')
    usr.save
    return usr
  end

  subject(:group) { Group.create(name: 'Group 1', icon: 'icon', user_id: user.id) }

  it 'is valid with valid attributes' do
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'is not valid without an icon' do
    group.icon = nil
    expect(group).to_not be_valid
  end
end
