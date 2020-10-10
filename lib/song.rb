class Song

    @@all = []

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        #get string names for artist and song
        song, artist = self.parse_filename(filename)
        #create a new instance of Song with name song 
        new_song = self.new(song)
        #find or create an instance of Artist &
        #Add the new_song instance of Song to the correspondng instance of Artist
        new_song.artist_name = artist
        new_song
    end

    def self.parse_filename(filename)
        parsed = filename.split(" - ")
        artist = parsed[0]
        song = parsed[1]
        return song, artist
    end

    attr_accessor :artist, :name

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def artist_name=(artist)
        @artist = Artist.find_or_create_by_name(artist)
    end

end