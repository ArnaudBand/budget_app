require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end
  it 'is database authenticable' do
    expect(user.valid_password?('password123')).to be_truthy
  end

  it 'is not database authenticable' do
    user.name = nil
    expect(user).to_not be_valid
  end
end
