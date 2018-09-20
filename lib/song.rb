class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song=Song.new
    song.save
    song
  end

  def self.new_by_name(title)
    song=Song.new
    song.name=title
    song
  end

  def self.create_by_name(title)
    song=Song.new
    song.name=title
    song.save
    song
  end

  def self.find_by_name(givenSong)
    self.all.detect do |song|
      song.name == givenSong
    end

  end

  def self.find_or_create_by_name(songName)
  self.find_by_name(songName) || self.create_by_name(songName)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(songName)
    songName.slice! (".mp3")
    split=songName.split(" - ")
    artist=split[0]
    song_Name=split[1]
    song=Song.new
    song.artist_name=artist
    song.name=song_Name
    song
  end

  def self.create_from_filename(songName)
    songName.slice! (".mp3")
    split=songName.split(" - ")
    artist=split[0]
    song_Name=split[1]
    song=Song.new
    song.artist_name=artist
    song.name=song_Name
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
