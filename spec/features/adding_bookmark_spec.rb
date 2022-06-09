feature 'adding bookmarks' do
  scenario 'user is adding a site to their bookmark manager' do
    visit('/bookmarks/new')
    fill_in 'url', with: 'http://www.bbc.co.uk'
    fill_in 'title', with: 'BBC'
    click_button 'Add Bookmark'
    expect(page).to have_link('BBC', href: "http://www.bbc.co.uk")
  end
end