require 'database_connection'
require 'database_helpers'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up the connection to the database using PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end

    it 'should have a persistent connection' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end
end