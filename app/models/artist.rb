class Artist
    
    attr_accessor :profile
    
    #Obtains raw artist data from API and assigns the artist profile description.
    def initialize(artist_id)
        @wrapper = Discogs::Wrapper.new("digmycrate")
        raw_artist_info = @wrapper.get_artist(artist_id)
        @profile = clean_artist_description(raw_artist_info.profile)
    end
    
    private
    
    #Fixes broken hyperlinks in the artist profile text.
    def clean_artist_description(description)
        if description.nil?
            cleaned_description = ""
        else
            cleaned_description = description.gsub(/(\[a\=\])/,'')
        end
        cleaned_description
    end
    
end
