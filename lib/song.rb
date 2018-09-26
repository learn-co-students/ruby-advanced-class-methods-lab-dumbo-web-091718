require'pry'

class Song
  attr_accessor :name, :artist_name
    @@all = []

  def initialize(name=nil, artist_name=nil)
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
   # return new_song = Song.new().save
       new_song = Song.new()
       new_song.save
       new_song
     # binding.pry
  end

  def self.new_by_name(name)
      new_song = self.create
      new_song.name = name
      new_song
      # instantiates a song with a name property
  end

  def self.create_by_name(name)
      new_song = Song.new(name)
      new_song.save
      new_song
  end
    # instantiates and saves a song with a name property


 def self.find_by_name(name)
   @@all.find do |song_name|# using find will return nil by default if not found
       # unless !song_name
       song_name.name == name
       # else nil
   # end
  end
end

def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
end
 # can also be @@all.find do |song_name|if !song_name nil else song_name.name == name...
 def my_meth(x, revers_alpha=false)
   if revers_alpha == false
      x.sort {|a,b| a <=> b}
   else
      x.sort {|a,b| b <=> a}
   end
end

def self.alphabetical
   self.all.sort_by {|a| a.name[0]}
end


def self.new_from_filename(file_name)
  # binding.pry  #file_name.split(/\s|\ -1./)
  a = file_name.split(/\s|\./)
  nu_artist_name = a[-6].join('')
  nu_song_name = a[2..5].join(' ')
          # a = "Thundercat - For Love I Come.mp3".split(/\s|\ ,./) #.uniq.split(".")
          # b = a = "Thundercat - For Love I Come.mp3".split(/\s|\ -1./)
          # c = b[-1]
          # puts d = c.split('')
          # p a
          # p d.join(3..-1)
          #  name = a[-1].chomp("3")
          #  p name
         # nu_song = Song.new
  nu_song = self.new_by_name(nu_song_name) #create_by_name
  nu_song.artist_name = nu_artist #

end
   # binding.pry
def self.destroy_all
  self.all.clear
end
# binding.pry
end
