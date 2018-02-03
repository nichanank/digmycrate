class RecordsController < ApplicationController
    
    def dig(username="nichanank")
        @username = username
        collection = Collection.new(username)
        if collection.nil?
            puts "Collection Unavailable"
        else
            record_ids = collection.get_record_ids
            @picked_record = collection.pick_random_record(record_ids)
            @picked_record_artist = Artist.new(@picked_record.artist_discogs_id)
            @picked_record
        end
    end
    
    helper_method :dig
    
end