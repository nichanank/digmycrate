class RecordsController < ApplicationController
    
    #Obtains a Discog user's collection data and picks a random recrd from it.
    #TO DO: handle non-existent or empty collection
    
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