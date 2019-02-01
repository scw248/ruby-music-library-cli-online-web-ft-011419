require "pry"
class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    
    if genre != nil
      self.genre = genre
    end
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song = self.new(name)
    @@all << song
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  # def self.find_by_name(name)
  #   @@all.find { |song| song.name == name }
  # end
  
  # def self.find_or_create_by_name(name)
  #     if Song.find_by_name(name)
  #       Song.find_by_name(name)
  #     else
  #       Song.create(name)
  #     end
  # end
  
  def self.new_from_filename(file)
    song = find_or_create_by_name(file.split(" - ")[1])
    artist = find_or_create_by_name(file.split(" - ")[0])
    genre = find_or_create_by_name(file.split(" - ")[2].split(".")[0])
    song.artist = artist
    song.genre = genre
    #binding.pry
    song
  end
  
  def self.create_from_filename(file)
  end
    
end