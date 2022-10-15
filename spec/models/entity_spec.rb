require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) do
    usr = User.new(name: 'John Doe', email: 'john@mail.com', password: '123456', password_confirmation: '123456')
    usr.confirm
    usr.save
    return usr
  end
  let(:group) do
    grp = Group.create(name: 'Group 1', icon: 'icon', user_id: user)
    grp.save
    return grp
  end
  subject(:entity) { Entity.create(name: 'Groceries', amount: 100, user_id: user.id) }

  it 'is valid with valid attributes' do
    expect(entity).to be_valid
  end

  it 'is not valid without a name' do
    entity.name = nil
    expect(entity).to_not be_valid
  end

  it 'is not valid if amount is not greater than 0' do
    entity.amount = 0
    expect(entity).to be_valid
  end
end
