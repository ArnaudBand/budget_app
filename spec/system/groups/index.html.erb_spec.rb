require 'rails_helper'
require_relative '../shared_file'

RSpec.describe 'Groups', type: :system do

  before(:each) do
    @user = User.new(name: 'Arnaud', email: 'arnaud@mail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    @user.save
    @group = Group.new(name: 'Housing', icon: '✈️', user: @user)
    @group.save
  end

  include_context 'common_context'

  describe 'index page:' do
    before(:each) do
      visit groups_path
    end

    it 'shows the page header' do
      expect(page).to have_content('Category')
    end

    it 'shows the button to create a new group' do
      expect(page).to have_selector(:link, 'Create a group')
    end

    context 'when clicking the Create a group button' do
      it 'shows the groups#new page' do
        first(:link, 'Create a group').click

        expect(page).to have_current_path new_group_path
      end
    end
  end
end
