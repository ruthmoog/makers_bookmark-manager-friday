# frozen_string_literal: true
feature 'index page' do
  scenario 'create a index page for the app' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end


feature 'view bookmarks' do
  scenario 'view a list of bookmarked URLs' do
    visit('/bookmarks')

    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makers.tech'
  end
end
