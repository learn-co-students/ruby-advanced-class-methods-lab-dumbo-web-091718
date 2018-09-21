class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(song)
    self.all.find {|x| x.name == song }
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create_by_name(song)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name || song
    end
  end

  def self.new_from_filename(song_file)
    array = song_file.split(" - ")
    new_song_file = array.last.split('.').first

    song = self.new
    song.name = new_song_file
    song.artist_name = array.first
    song

  end

  def self.create_from_filename(song_file)
    @@all << self.new_from_filename(song_file)
  end

  def self.destroy_all
    @@all = []
  end

end
