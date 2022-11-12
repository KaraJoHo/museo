require 'rspec'
require './lib/photograph'
require './lib/artist'
require './lib/curator'

RSpec.describe Curator do
  it 'exists' do
    curator = Curator.new

    expect(curator).to be_a(Curator)
  end

  it 'has an array of photographs' do
    curator = Curator.new

    expect(curator.photographs).to eq([])
  end

  it 'has an array of artists' do
    curator = Curator.new

    expect(curator.artists).to eq([])
  end

  describe '#add_photographs' do
    it 'adds photograph objects to the photographs array' do
      curator = Curator.new
      photo_1 = Photograph.new({
                                id: "1",
                                name: "Rue Mouffetard, Paris (Boy with Bottles)",
                                artist_id: "1",
                                year: "1954"
                              })

      photo_2 = Photograph.new({
                                 id: "2",
                                 name: "Moonrise, Hernandez",
                                 artist_id: "2",
                                 year: "1941"
                              })
      curator.add_photograph(photo_1)
      curator.add_photograph(photo_2)

      expect(curator.photographs).to eq([photo_1, photo_2])
    end
  end

  describe '#add_artist' do
    it 'adds artist objects to the artists array' do
      curator = Curator.new
      artist_1 = Artist.new({
                              id: "1",
                              name: "Henri Cartier-Bresson",
                              born: "1908",
                              died: "2004",
                              country: "France"
                            })
      artist_2 = Artist.new({
                              id: "2",
                              name: "Ansel Adams",
                              born: "1902",
                              died: "1984",
                              country: "United States"
                            })
      curator.add_artist(artist_1)
      curator.add_artist(artist_2)
      expect(curator.artists).to eq([artist_1, artist_2])

    end
  end
end
