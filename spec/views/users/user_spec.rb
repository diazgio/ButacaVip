require 'rails_helper'

RSpec.describe 'Users' do
  before :each do
    @user1 = User.create(name: 'adam', email: 'test1@test.com', id: 1)
    @user2 = User.create(name: 'john', email: 'test2@test.com', id: 2)
    @user3 = User.create(name: 'mike', email: 'test3@test.com', id: 3)
    @user1.attendances.create(user_id: 1, event_id: 2)
    @user3.attendances.create(user_id: 3, event_id: 2)
  end
  feature 'User can' do
    scenario 'user can login and logout' do
      visit '/login'
      fill_in 'name', with: 'adam'
      click_button 'Login'
      expect(page).to have_content('User was successfully Loged In')
      click_on 'Log Out'
      expect(page).to have_content('Logout')
    end

    scenario 'user show page' do
      visit '/login'
      fill_in 'name', with: 'john'
      click_button 'Login'
      expect(page).to have_content('User was successfully Loged In')
      click_on 'john'
      visit '/users/2'
      expect(page).to have_content('john')
    end
  end
end
