require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  subject(:group) { Group.create(name: 'Group 1', icon: 'icon', user_id: user.id) }

  it 'is not valid without a name' do
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'is not valid without an icon' do
    group.icon = nil
    expect(group).to_not be_valid
  end
end
