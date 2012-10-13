require 'spec_helper'

feature 'user can update content' do
  scenario 'user updates content' do
    visit '/'
    click_link 'Login'
    click_link 'Edit'
    fill_in 'value', with: 'test'
    click_button 'Save "home"'
    visit '/'
    page.should have_content('test')
  end

  scenario 'user updates content inline', js: true do
    visit '/'
    click_link 'Login'
    click_link 'Edit'
    find('.editor').set('test')
    click_link 'Save'
    page.should have_content('test')
    page.should have_content('Edit')
    visit '/'
    page.should have_content('test')
  end

  scenario 'user updates multiple content blocks', js: true do
    visit '/'
    click_link 'Login'

    within("#ventana-about") do
      click_link 'Edit'
      find('.editor').set('about test')
      click_link 'Save'
    end

    within("#ventana-home") do
      click_link 'Edit'
      find('.editor').set('home test')
      click_link 'Save'
    end

    within("#ventana-about") do
      page.should have_content('about test')
      page.should have_content('Edit')
    end

    within("#ventana-home") do
      page.should have_content('home test')
      page.should have_content('Edit')
    end

    visit '/'

    within("#ventana-about") do
      page.should have_content('about test')
      page.should have_content('Edit')
    end

    within("#ventana-home") do
      page.should have_content('home test')
      page.should have_content('Edit')
    end
  end
end
