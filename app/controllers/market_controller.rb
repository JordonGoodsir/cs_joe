class MarketController < ApplicationController  
    before_action :profile_check

    def index   
      # showing all listings
        @random_listings = Listing.all 
    end 

    def show  

      # on buy i want to first check if apt money is in account

    end    

    def transaction 
      # testing to see if the current users profile wallet has enough funds bassed off of the listing selling_price
      if Profile.find(@current_profile).wallet < Listing.find(params[:id]).selling_price  
        redirect_to root_path 
      else  
       
        # finding current users profile
        # deduct money from buyer (current user)  
        buyer = Profile.find(@current_profile)  
        buyer.update(wallet: buyer.wallet - Listing.find(params[:id]).selling_price)
       
        # finding the sellers profile
        # give money to seller   
        seller = Listing.find(params[:id]).seller.profile  
        seller.update(wallet: seller.wallet + Listing.find(params[:id]).selling_price) 

        # # give item to buyer 
        Item.create(profile_id:@current_profile, skin_id:Listing.find(params[:id]).skin_id) 
        
        #  # destroy listing  
        Listing.find(params[:id]).delete  

        respond_to do |format| 

          format.html { redirect_to inventory_path(@current_profile), notice: "Purchase Successful"}

        end
      end
    end



    private 

    def profile_check   
        if current_user
          @current_profile = Profile.find_by(user_id: current_user).id 
        end  
      end

end