feature 'index page' do
  scenario 'create a index page for the app' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end
