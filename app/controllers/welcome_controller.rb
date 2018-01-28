class WelcomeController < ApplicationController
    
    def index
        @user_name = "nichanank"
        @picked_record = dig_and_pick
    end
    
    def dig_and_pick
        raw_collection_data = Collection.new(@user_name)
        collection_ids = raw_collection_data.get_record_ids
        picked_record = raw_collection_data.pick_random_record(collection_ids)
        picked_record
    end
    
end
