require 'rails_helper'
require_relative '../shared_file'

RSpec.describe 'Splashes', type: :system do
  before(:each) do
    @user = User.new(name: 'Arnaud', email: 'arnaud@mail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    @user.save
    @group = Group.new(name: 'Housing', icon: '✈️', user: @user)
    @group.save
  end
  include_context 'common_context'

  describe 'index page:' do
    context 'when logged in' do
      before(:each) do
        visit root_path
      end

      it 'redirects to groups page' do
        expect(page).to have_current_path groups_path
      end
    end

    context 'when logged out' do
      before(:each) do
        logout
        visit '/'
      end

      it 'has the Log In button' do
        expect(page).to have_selector(:link, 'Login')
      end

      it 'has the Sign Up button' do
        expect(page).to have_selector(:link, 'Sign Up')
      end

      context 'when clicking the Log in button' do
        it 'it shows the users/sessions#new' do
          first(:link, 'Login').click

          expect(page).to have_current_path new_user_session_path
        end
      end

      context 'when clicking the Sign up button' do
        it 'it shows the devise/registrations#new page' do
          first(:link, 'Sign Up').click

          expect(page).to have_current_path new_user_registration_path
        end
      end
    end
  end
end
