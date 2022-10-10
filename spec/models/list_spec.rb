require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:group) { Group.create(name: 'Group 1', icon: 'icon') }
  subject(:list) { List.create(name: 'Groceries', amount: 100, user_id: user.id, group_id: group.id) }

  it 'is valid with valid attributes' do
    expect(list).to be_valid
  end

  it 'is not valid without a name' do
    list.name = nil
    expect(list).to_not be_valid
  end

  it 'is not valid without an amount' do
    list.amount = nil
    expect(list).to_not be_valid
  end

  it 'is not valid if amount is not greater than 0' do
    list.amount = 0
    expect(list).to_not be_valid
  end
end
