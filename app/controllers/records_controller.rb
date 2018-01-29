class RecordsController < ApplicationController
    
    def dig
        @user_name = "nichanank"
        raw_collection_data = Collection.new(@user_name)
        collection_ids = raw_collection_data.get_record_ids
        picked_record = raw_collection_data.pick_random_record(collection_ids)
        @picked_record = picked_record
        picked_record
    end
    
    helper_method :dig
    
end