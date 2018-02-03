class RecordsController < ApplicationController
    
    def dig
        user_name = "nichanank"
        collection = Collection.new(user_name)
        record_ids = collection.get_record_ids
        @picked_record = collection.pick_random_record(record_ids)
        get_artist_info(@picked_record)
        @picked_record
    end
    
    def get_artist_info(picked_record)
        @picked_record_artist = Artist.new(picked_record.artist_discogs_id)
    end
    
    helper_method :dig
    
end