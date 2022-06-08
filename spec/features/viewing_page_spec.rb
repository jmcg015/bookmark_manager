feature 'Viewing bookmarks on the page' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'visiting the bookmarks route' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com/"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
  end
end