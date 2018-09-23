class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = Song.new
    song.name=(name)
    song.save
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name=(name)
    song.save
    song
  end

  def self.find_by_name(name)
    find_song = @@all.select {|song| song.name == name}
    find_song[0]
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    unique_arr = @@all.uniq
    unique_arr.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    song_arr = file.split(" - ")
    artist = song_arr[0]
    song_name = song_arr[1].split(".mp3").join("")
    song = Song.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    song_arr = file.split(" - ")
    artist = song_arr[0]
    song_name = song_arr[1].split(".mp3").join("")
    song = Song.create
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
