class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    loop do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      answer = gets.chomp
      break if answer == 'exit'
    end
  end
  
  def list_songs
    counter = 1
    songs = Song.all.sort_by { |song| song.name }
    #binding.pry
    songs.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      #binding.pry
      counter += 1
    end
  end
  
  def list_artists
    counter = 1
    artists = Artist.all.sort_by { |artist| artist.name }
    #binding.pry
    artists.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end
  
  def list_genres
    counter = 1
    genres = Genre.all.sort_by { |genre| genre.name }
    #binding.pry
    genres.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end
end