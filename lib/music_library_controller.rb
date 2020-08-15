class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end 
  
  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    4.times {gets.chomp}
  end 
  
  #CLI methods 
  
  def list_songs
    Song.all.sort{|a,b| a.name <=> b.name}.each_with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end 
  end 
  
  def list_artists
    Artist.all.sort{|a,b| a.name <=> b.name}.each_with_index do |a, i|
      puts "#{i+1}. #{a.name}"
    end 
  end 
  
  def list_genres
    Genre.all.sort{|a,b| a.name <=> b.name}.each_with_index do |g, i|
      puts "#{i+1}. #{g.name}"
    end 
  end 
  
  def list_songs_by_artist
   puts "Please enter the name of an artist:"
    a_input = gets.chomp
    a_input.each_with_index do |s, i|
      puts "#{i+1}. #{s.name} - #{s.genre.name}"
  end 
  
end 