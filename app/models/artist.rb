class Artist
    
    attr_accessor :profile
    
    def initialize(artist_id)
        @wrapper = Discogs::Wrapper.new("digmycrate")
        raw_artist_info = @wrapper.get_artist(artist_id)
        @profile = raw_artist_info.profile
    end
    
end
