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

  def find_photograph_by_artist_id(id)
    found = []
     @photographs.find_all do |photograph|
      found << photograph.id.include?(id)
    end
  end

  def photo_by_artist
    pairs = {}
    @artists.each_with_index do |artist, index|
      pics = @photographs.find_all do |photograph|
        if artist.id == photograph.artist_id
          photos = []
          photos << photograph.artist_id
        end
      end
      pairs[artist] = pics
    end
    pairs
  end

  def artists_with_multiple_photographs
    artist_name =[]
    photo_by_artist.each do |artist|
      artist.flatten
        if photo_by_artist[artist[0]].length >= 2
        artist_name << artist[0].name
      end
    end
    artist_name
  end
end
