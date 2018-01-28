class Collection
    
    attr_accessor :records
    
    #Records is an array of Hashes for record info
    def initialize(user_name)
        @wrapper = Discogs::Wrapper.new("digmycrate")
        @collection = @wrapper.get_user_collection(user_name)
    end
    
    def get_record_ids
        @ids = []
        @collection.releases.each do |release|
            @ids << release['id']
        end
        @ids
    end
    
    def pick_random_record(ids)
        random_pick = ids.sample
        title =  @wrapper.get_release(random_pick)['title']
        artist =  @wrapper.get_release(random_pick).artists[0].name
        year =  @wrapper.get_release(random_pick).year
        genre =  @wrapper.get_release(random_pick)['genre']
        styles = @wrapper.get_release(random_pick)['styles']
        description =  @wrapper.get_release(random_pick)['profile']
        cover_image = @wrapper.get_release(random_pick)['cover_image']
        picked_record = Record.new(title, artist, year, genre, cover_image, description)
        picked_record
    end

end