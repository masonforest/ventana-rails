require 'spec_helper'

feature 'user can update content' do
  scenario 'user updates content' do
    visit '/'
    click_link 'Login'
    click_link 'Edit'
    fill_in 'value', with: 'test'
    save_and_open_page
    click_button 'Save "home"'
    visit '/'
    page.should have_content('test')
  end

  scenario 'user updates content inline', js: true do
    visit '/'
    click_link 'Login'
    click_link 'Edit'
    fill_in 'editor', with: 'test'
    click_link 'Save'
    page.should have_content('test')
    visit '/'
    page.should have_content('test')
  end
end
