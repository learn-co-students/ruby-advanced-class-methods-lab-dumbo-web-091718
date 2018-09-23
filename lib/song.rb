require 'pry'
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

  def self.new_by_name(name)
    song = Song.new
    song.name  = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.find do |track|
      track.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name)
    self.create_by_name(name)
    return self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |track|
      track.name
    end
  end

  def self.new_from_filename(name)
    trackName = name.split("-").last.split(".mp3")
    fmtTrack=trackName.first.strip
    artistName = name.split("-").first.strip

    song = self.new
    song.name = fmtTrack
    song.artist_name = artistName
    return song
  end

   def self.create_from_filename(name)
     @@all << self.new_from_filename(name)
   end

  def self.destroy_all
    @@all.clear
  end

end
