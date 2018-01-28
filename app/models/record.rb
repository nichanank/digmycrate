class Record
    
    attr_accessor :title, :artist, :year, :genre, :cover_image, :description
    
    def initialize(title, artist, year, genre, cover_image, description="")
        @title = title
        @artist = artist
        @year = year
        @genre = genre
        @cover_image = cover_image
        @description = description
    end
    
    def record_info_dict
        dict = { "title" => @title, "artist" => @artist, "year" => @year, "genre" => genre, "img" => cover_image, "description" => @description }
        dict
    end
    
    
end
