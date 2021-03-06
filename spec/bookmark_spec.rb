require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Makers Academy"
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.example.org', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)
      
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.example.org'
    end

    it 'does not create a new bookmark with an invalid URL' do
      Bookmark.create(url: 'not a real bookmark', title: 'not a real bookmark')
      expect(Bookmark.all).to be_empty
    end
  end

  describe '.delete' do
    it 'deletes a specific bookmark' do
      bookmark = Bookmark.create(url: "http://www.bbc.co.uk", title: "BBC")
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the title and URL for a bookmark' do
      bookmark = Bookmark.create(url: "http://www.bbc.co.uk", title: "BBC")
      Bookmark.update(id: bookmark.id, url: "http://www.bbc.co.uk/sport", title: "BBC Sport")

      bookmarks = Bookmark.all
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'BBC Sport'
      expect(bookmarks.first.url).to eq 'http://www.bbc.co.uk/sport' 
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(url: "http://www.bbc.co.uk", title: "BBC")
      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'BBC'
      expect(result.url).to eq 'http://www.bbc.co.uk' 
    end
  end
end