require 'pry'

class Artist

    @@all = []

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        artist = self.find_artist(name)
        artist ? artist : self.new(name) 
    end

    def self.find_artist(name)
        self.all.find { |artist| artist.name == name }
    end

    attr_accessor :name

    def initialize(name)
        @name = name
        self.class.all << self
        self
    end

    def add_song(song)
        song.artist = self
    end

    def songs 
        Song.all.select { |song| song.artist == self }
    end

    def print_songs
        songs = self.songs
        songs.each { |song| puts song.name }
    end

end