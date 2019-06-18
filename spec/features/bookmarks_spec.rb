feature 'view bookmarks' do
  scenario 'view a list of bookmarked URLs' do
    visit('/bookmarks')

    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.makersacademy.com'
  end
end
