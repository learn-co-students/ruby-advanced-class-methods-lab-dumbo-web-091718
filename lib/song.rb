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
    found_song = self.find_by_name(song_name)
    found_song ? self.find_by_name(song_name) : self.create_by_name(song_name) 
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    components = filename.split(' - ') 
    artist = components[0]
    song_name = components[1].sub(/\.mp3\b/, '')

    song = Song.create_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
  end

  def self.destroy_all 
    @@all.clear
  end
end
