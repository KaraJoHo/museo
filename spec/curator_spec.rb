require 'rspec'
require './lib/photograph'
require './lib/artist'
require './lib/curator'

RSpec.describe Curator do
  it 'exists' do
    curator = Curator.new

    expect(curator).to be_a(Curator)
  end
end
