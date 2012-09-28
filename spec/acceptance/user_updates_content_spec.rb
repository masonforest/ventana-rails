require 'spec_helper'

feature 'user can update content' do
  scenario 'user updates content', js: true do
    visit '/'
    save_and_open_page
    click_link 'Login'
    click_link 'Edit'
    fill_in 'editor', with: "test"
    click_link 'Save'
    page.should have_content('test')
    visit '/'
    page.should have_content('test')
  end
end
