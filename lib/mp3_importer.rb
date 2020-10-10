require 'pry'
class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        x = Dir.entries(path)
        x.filter { |i| i.end_with?(".mp3")  }
    end

    def import
        filenames = self.files
        filenames.each do |file|
            file = parse_filename(file)
            Song.new_by_filename(file)
        end
    end

    # takes an array of file names in the format 
    # "song - artist - genre.mp3" and returns a file in the 
    # fromat "song - artist"
    def parse_filename(filename)

         filename = filename.split(" - ")
         #just incase we end up wanting to know about the genre later
         genre = filename.pop
         filename = filename.join(" - ")
    end

end