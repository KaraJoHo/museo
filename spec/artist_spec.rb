require 'rspec'
require './lib/artist'

RSpec.describe Artist do
  it 'exists and has attributes' do
    attributes = {
                    id: "2",
                    name: "Ansel Adams",
                    born: "1902",
                    died: "1984",
                    country: "United States"
                  }
    artist = Artist.new(attributes)

    expect(artist).to be_a(Artist)
    expect(artist.id).to eq("2")
    expect(artist.name).to eq("Ansel Adams")
    expect(artist.born).to eq("1902")
    expect(artist.died).to eq("1984")
    expect(artist.country).to eq("United States")
  end

  describe '#age_at_death' do
    it 'returns the age of the artist died' do
      attributes = {
                      id: "2",
                      name: "Ansel Adams",
                      born: "1902",
                      died: "1984",
                      country: "United States"
                    }
      artist = Artist.new(attributes)

      expect(artist.age_at_death).to eq(82)
    end
  end
end
