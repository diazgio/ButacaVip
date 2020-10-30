require 'rails_helper'

RSpec.describe 'Test to verify if users have events' do
  before :each do
    @user1 = User.create(name: 'adam', email: 'test1@test.com', id: '1')
    @user2 = User.create(name: 'john', email: 'test2@test.com', id: '2')
    @user3 = User.create(name: 'mike', email: 'test3@test.com', id: '3')
    Event.create(id:'1', creator_id: 1, artist: 'Adam Sandler', location:'test place 1', description:'descrpition test', start_date: '2020-10-31', end_date:'2020-10-31')
    Event.create(id:'2', creator_id: 2, artist: 'Anna Carina', location:'test place 2', description:'descrpition test', start_date: '2020-11-30', end_date:'2020-11-30')
    Event.create(id:'3', creator_id: 3, artist: 'Mike Mayers', location:'test place 3', description:'descrpition test', start_date: '2020-12-31', end_date:'2020-12-31')
  end

  feature 'User can attend events' do
    scenario 'sign in and go to index page' do
      visit '/login'
      fill_in 'name', with: 'john'
      click_button 'Login'
      visit '/events/1'
      expect(page).to have_content('Attend')
      click_on 'Attend'
      visit '/events/1'
      expect(page).to have_content('john')
    end
  end

end
