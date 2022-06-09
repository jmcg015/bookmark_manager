feature 'updating existing bookmarks' do
  scenario 'updating a given bookmark' do
    bookmark = Bookmark.create(url: "http://www.bbc.co.uk", title: "BBC")
    visit('/bookmarks')
    expect(page).to have_link("BBC", href: "http://www.bbc.co.uk")
    first(".bookmark").click_button 'Edit'
    
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
    
    fill_in 'url', with: 'http://www.bbc.co.uk/sport'
    fill_in 'title', with: 'BBC Sport'
    click_button "Submit"

    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link("BBC Sport", href: "http://www.bbc.co.uk/sport")
    expect(page).not_to have_link("BBC", href: "http://www.bbc.co.uk")
  end
end