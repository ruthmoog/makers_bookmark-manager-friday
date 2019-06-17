feature 'view bookmarks' do
  scenario 'view a list of bookmarked URLs' do
    visit('/bookmarks')

    expect(page).to have_content 'http://www.gmail.com'
    expect(page).to have_content 'http://www.outlook.com'
    expect(page).to have_content 'http://www.makers.tech'
  end
end
