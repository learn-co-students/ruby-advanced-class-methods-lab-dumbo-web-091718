class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def intialize(song)
    @all << song
    self.create = song.new
    self.create_by_name = song.name
end

def self.create
  song = self.new
  @@all << song
  song
end

def self.new_by_name(song_name)
  song = self.new
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
  @@all.find do |song| song.name == song_name
  end
end


def self.find_or_create_by_name(song_name)
  self.find_by_name(song_name) || self.create_by_name(song_name)
end

def self.alphabetical
  self.all.sort_by { |a| a.name }
end

def self.new_from_filename(filename)
  parts = filename.split(' - ')
  artist = parts[0]
  song_name = parts[1].sub(/\.mp3\b/, '')

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
