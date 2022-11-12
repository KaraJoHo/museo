class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo_obj)
    @photographs << photo_obj
  end

  def add_artist(artist_obj)
    @artists << artist_obj
  end

  def find_artist_by_id(id)
    found = @artists.find_all do |artist|
     artist.id.include?(id)
    end
    found_artist = found.pop
  end
end
