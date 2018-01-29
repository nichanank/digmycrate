class Record
    
    attr_accessor :title, :artist, :year, :genre, :styles, :cover_image, :description, :tracklist
    
    def initialize(title, artist, year, genre, styles, cover_image="", description="", tracklist=[])
        @title = title
        @artist = artist
        @year = year
        @genre = genre
        @styles = styles
        @cover_image = cover_image
        @description = description
        @tracklist = tracklist
    end
    
    def 
    
    def record_info_dict
        dict = { "title" => @title, "artist" => @artist, "year" => @year, "genre" => genre, "styles" => styles, "img" => cover_image, "description" => @description }
        dict
    end

end
