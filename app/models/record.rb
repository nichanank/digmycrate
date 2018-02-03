class Record
    
    attr_accessor :title, :artist, :artist_discogs_id, :year, :genre, :styles, :cover_image, :description, :tracklist
    
    def initialize(raw_record_info)
        parse_raw_info(raw_record_info)
    end
    
    private
    
    def parse_raw_info(raw_record_info)
        @title = raw_record_info['title']
        @artist = raw_record_info.artists[0].name
        @artist_discogs_id = raw_record_info.artists[0]['id']
        @year = raw_record_info.year
        @genre = raw_record_info['genres'].join(", ")
        if raw_record_info['styles'].nil?
            @styles = []
        else 
            @styles = raw_record_info['styles'].join(", ")
        end
        @description = raw_record_info['profile']
        @cover_image = raw_record_info.images[0]
        @tracklist = raw_record_info.tracklist
    end
    
end
