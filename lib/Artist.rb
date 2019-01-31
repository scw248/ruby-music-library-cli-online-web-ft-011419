require "pry"
class Artist
  
  attr_accessor :name, :songs
  # attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
  
  def add_song(song)
    if !song.artist
    song.artist = self
    end
    @songs << song unless @songs.include?(song)
    #binding.pry
  end
  
end