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

  describe '#find_artist_by_id' do
    it 'finds the artist by their id' do
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

      expect(curator.find_artist_by_id("1")).to eq(artist_1)
    end
  end

  describe '#photographs_by_artist' do
    it 'finds all the photographs by the artist' do
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


      photo_3 = Photograph.new({
                                id: "3",
                                name: "Identical Twins, Roselle, New Jersey",
                                artist_id: "3",
                                year: "1967"
                                })

      photo_4 = Photograph.new({
                                id: "4",
                                name: "Monolith, The Face of Half Dome",
                                artist_id: "3",
                                year: "1927"
                                })
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
      artist_3 = Artist.new({
                             id: "3",
                             name: "Diane Arbus",
                             born: "1923",
                             died: "1971",
                             country: "United States"
                            })
      curator.add_artist(artist_1)
      curator.add_artist(artist_2)
      curator.add_artist(artist_3)

      curator.add_photograph(photo_1)
      curator.add_photograph(photo_2)
      curator.add_photograph(photo_3)
      curator.add_photograph(photo_4)

      expected = {
                    artist_1 => [photo_1],
                    artist_2 => [photo_2],
                    artist_3 => [photo_3, photo_4]
                  }

      expect(curator.photo_by_artist).to eq(expected)
    end
  end
  describe '#artists_with_multiple_photographs' do
    it' returns array of artist names with multiple photographs' do
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


      photo_3 = Photograph.new({
                                id: "3",
                                name: "Identical Twins, Roselle, New Jersey",
                                artist_id: "3",
                                year: "1967"
                                })

      photo_4 = Photograph.new({
                                id: "4",
                                name: "Monolith, The Face of Half Dome",
                                artist_id: "3",
                                year: "1927"
                                })
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
      artist_3 = Artist.new({
                             id: "3",
                             name: "Diane Arbus",
                             born: "1923",
                             died: "1971",
                             country: "United States"
                            })
      curator.add_artist(artist_1)
      curator.add_artist(artist_2)
      curator.add_artist(artist_3)

      curator.add_photograph(photo_1)
      curator.add_photograph(photo_2)
      curator.add_photograph(photo_3)
      curator.add_photograph(photo_4)

      expected = {
                    artist_1 => [photo_1],
                    artist_2 => [photo_2],
                    artist_3 => [photo_3, photo_4]
                  }

      expect(curator.artists_with_multiple_photographs).to eq(["Diane Arbus"])
    end
  end
end
