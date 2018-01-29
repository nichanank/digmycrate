class Collection
    
    attr_accessor :records
    
    #Records is an array of Hashes for record info, pulled from Discogs user data
    def initialize(user_name)
        @wrapper = Discogs::Wrapper.new("digmycrate")
        @collection = @wrapper.get_user_collection(user_name)
    end
    
    #Returns an array of record IDs in a collection
    def get_record_ids
        @ids = []
        @collection.releases.each do |release|
            @ids << release['id']
        end
        @ids
    end
    
    def pick_random_record(ids)
        random_pick = ids.sample
        raw_record_info = @wrapper.get_release(random_pick)
        title = raw_record_info['title']
        artist = raw_record_info.artists[0].name
        year = raw_record_info.year
        genre = raw_record_info['genres'].join(", ")
        if raw_record_info['styles'].nil?
            styles = []
        else 
            styles = raw_record_info['styles'].join(", ")
        end
        description = raw_record_info['profile']
        cover_image = raw_record_info.images[0]
        tracklist = raw_record_info.tracklist
        picked_record = Record.new(title, artist, year, genre, styles, cover_image, description, tracklist)
        picked_record
    end

end