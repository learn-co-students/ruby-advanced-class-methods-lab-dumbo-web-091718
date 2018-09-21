require "pry"

class Song
  attr_accessor :all, :name, :artist_name

  @@all = []
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end

  def self.create
    song = self.new 
    @@all << song 
    song 
  end

  def self.new_by_name(song_name)
    song = Song.new 
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name 
    @@all << song
    song
  end

  def self.find_by_name(song_name)
    @@all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name) 
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  # Helper method.
  def self.parse(filename)
    components = filename.split(' - ') 
    artist = components[0]
    song_name = components[1].sub(/\.mp3\b/, '')
    [song_name, artist]
  end

  def self.new_from_filename(filename)
    parsed_file = self.parse(filename)
    song = Song.create_by_name(parsed_file[0])
    song.artist_name = parsed_file[1]
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
  end

  def self.destroy_all 
    @@all.clear
  end
end