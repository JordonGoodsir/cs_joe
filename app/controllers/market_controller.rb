class MarketController < ApplicationController  

    def index  
        @random_listings = Listing.all 
    end 

    def show 

    end

end