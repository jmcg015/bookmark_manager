feature 'adding bookmarks' do
  scenario 'user is adding a site to their bookmark manager' do
    visit('/bookmarks/new')
    fill_in 'url', with: 'http://www.bbc.co.uk'
    fill_in 'title', with: 'BBC'
    click_button 'Add Bookmark'
    expect(page).to have_link('BBC', href: "http://www.bbc.co.uk")
  end

  scenario 'should check the given URL is valid' do
    visit('/bookmarks/new')
    fill_in 'url', with: 'not a url'
    click_button "Add Bookmark"
    expect(page).not_to have_content "not a url"
    expect(page).to have_content "You must enter a valid URL"
  end
end