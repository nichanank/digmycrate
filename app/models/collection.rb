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
        picked_record = Record.new(raw_record_info)
        picked_record
    end

end