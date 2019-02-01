class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.entries(path).select { |file| file != "." && file != ".." }
  end
  
  def self.import
    files.each { |file| Song.new_by_filename(file) }
  end
  
  
end