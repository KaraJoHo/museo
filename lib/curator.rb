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
end
