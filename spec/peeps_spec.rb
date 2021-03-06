require 'pg'

require 'peeps'

describe Peeps do
  subject(:peeps) { described_class }
  describe '.view' do
    it 'returns peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (legionnaire, peep) VALUES ('peep spec user 1','peep spec peep 1');")
      expect(peeps.view).to include ['peep spec user 1', 'peep spec peep 1']
    end

  end

  describe '.add' do
    it "adds a new peep" do
      user = "Helena Sykes"
      peep = "peep spec peep 2"
      peeps.add(user, peep)
      expect(peeps.view).to include [user, peep]
    end
  end
end
