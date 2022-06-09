feature 'deleting bookmarks' do
  scenario 'deleting a bookmark from bookmark_manager' do
    Bookmark.create(url: "http://www.bbc.co.uk", title: "BBC")
    visit('/bookmarks')
    expect(page).to have_link('BBC', href: "http://www.bbc.co.uk")

    first('.bookmark').click_button "Delete"
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('BBC', href: "http://www.bbc.co.uk")
  end
end