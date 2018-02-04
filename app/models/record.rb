class Record
    
    attr_accessor :title, :artist, :artist_discogs_id, :year, :genre, :styles, :cover_image, :description, :tracklist, :youtube_id, :video_title
    
    def initialize(raw_record_info)
        parse_raw_info(raw_record_info)
        pick_random_video_from_tracklist if !@videos.empty?
    end
    
    private
    
    def parse_raw_info(raw_record_info)
        @title = raw_record_info['title']
        @artist = raw_record_info.artists[0].name
        @artist_discogs_id = raw_record_info.artists[0]['id']
        @year = raw_record_info.year
        @genre = raw_record_info['genres'].join(", ")
        if raw_record_info['styles'].nil?
            @styles = []
        else 
            @styles = raw_record_info['styles'].join(", ")
        end
        @description = raw_record_info['profile']
        @cover_image = raw_record_info.images[0]
        @tracklist = raw_record_info.tracklist
        if raw_record_info['videos'].nil?
            @videos = []
        else
            @videos = raw_record_info['videos']
        end
        
    end
    
    def pick_random_video_from_tracklist
        random_video = @videos.sample
        @youtube_id = get_youtube_id(random_video.uri)
        @video_title = random_video.description.titleize
    end
    
    private
    
    def get_youtube_id(url)
        id = ''
        url = url.gsub(/(>|<)/i,'').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
        if url[2] != nil
            id = url[2].split(/[^0-9a-z_\-]/i)
            id = id[0];
        else
            id = url;
        end
        id
    end
    
    # Add an action to initiate the process.
    def authenticate
      @discogs = Discogs::Wrapper.new("Test OAuth")
      request_data = @discogs.get_request_token(DISCOGS_API_KEY, DISCOGS_API_SECRET, "http://127.0.0.1:3000/callback")
    
      session[:request_token] = request_data[:request_token]
    
      redirect_to request_data[:authorize_url]
    end

    # And an action that Discogs will redirect back to.
    def callback
      @discogs      = Discogs::Wrapper.new("Test OAuth")
      request_token = session[:request_token]
      verifier      = params[:oauth_verifier]
      access_token  = @discogs.authenticate(request_token, verifier)
    
      session[:request_token] = nil
      session[:access_token]  = access_token
    
      @discogs.access_token = access_token
    
      # You can now perform authenticated requests.
    end
    
    # Once you have it, you can also pass your access_token into the constructor.
    def another_action
      @discogs = Discogs::Wrapper.new("Test OAuth", access_token: session[:access_token])
    
      # You can now perform authenticated requests.
    end
    
end
