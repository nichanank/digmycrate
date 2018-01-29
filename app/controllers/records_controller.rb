class RecordsController < ApplicationController
    
    def dig
        user_name = "nichanank"
        @collection = Collection.new(user_name)
        @collection_ids = @collection.get_record_ids
        @picked_record = @collection.pick_random_record(@collection_ids)
        @picked_record
    end
    
    helper_method :dig
    
end