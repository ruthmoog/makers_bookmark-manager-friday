# frozen_string_literal: true
feature 'index page' do
  scenario 'create a index page for the app' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end


feature 'view bookmarks' do
  scenario 'view a list of bookmarked URLs' do
    Bookmark.create(url: "http://www.destroyallsoftware.com")
    Bookmark.create(url: "http://www.google.com")
    Bookmark.create(url: "http://www.makers.tech")

    visit('/bookmarks')

    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makers.tech'
  end
end

feature 'add bookmarks' do
  scenario 'complete a form to add a bookmark' do
    visit('/')
    fill_in('url', :with => 'http://www.facebook.com')
    click_button('add')
    expect(page).to have_content 'http://www.facebook.com'
  end
end
