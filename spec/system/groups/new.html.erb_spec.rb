require 'rails_helper'
require_relative '../shared_file'

RSpec.describe 'groups/new.html.erb', type: :system do
  before(:each) do
    @user = User.new(name: 'Arnaud', email: 'arnaud@mail.com', password: '123456', password_confirmation: '123456')
    @user.save
    @group = Group.new(name: 'Housing', icon: '✈️', user: @user)
    @group.save
  end

  include_context 'common_context'

  it 'should create a new group' do
    visit new_group_path
    fill_in 'Name', with: 'Group 2'
    select '✈️', from: 'Icon'
    click_on 'Add new category'
    visit groups_path
    expect(page).to have_content('Group 2')
  end
end
