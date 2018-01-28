class WelcomeController < ApplicationController
    
    def index
        @user_name = "nichanank"
        get_record_info(dig_and_pick)
    end
    
    def dig_and_pick
        raw_collection_data = Collection.new(@user_name)
        collection_ids = raw_collection_data.get_record_ids
        picked_record = raw_collection_data.pick_random_record(collection_ids)
        picked_record
    end
    
    def get_record_info(picked_record)
        @title = picked_record.title
        @artist = picked_record.artist
        @year = picked_record.year
        @genre = picked_record.genre
        @cover_image = picked_record.cover_image
        @description = picked_record.description
    end
    
end
