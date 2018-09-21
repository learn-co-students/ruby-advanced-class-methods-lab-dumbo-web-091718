require 'pry'

class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self # @@all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(title)
    @@all.find do |song|
      song.name == title
    end
  end

  def self.find_or_create_by_name(title)
    self.create_by_name(title)
    self.find_by_name(title)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    no_extension = arr.last.split('.').first

    song = self.new
    song.name = no_extension
    song.artist_name = arr.first
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

end
