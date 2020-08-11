class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy] 
  before_action :profile_check

  # GET /listings
  # GET /listings.json
  def index 
    # finds all listings made based off of seller id
    @listings = Listing.where(seller_id: @current_profile)  
  end 

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new 
    # starts the process of a new instance of listing whcih can them be saved
    @listing = Listing.new  
    @@url_info = params 
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    # assigning values to the listing
    @listing = Listing.new do |v| 
      v.skin_id = @@url_info["skin_id"] 
      v.seller_id = @@url_info["profile_id"] 
      v.selling_price = params["listing"]["selling_price"]
    end    

    respond_to do |format|
      if @listing.save   
        # finding an item based off properties fed to it
        Item.find_by(profile_id: @@url_info["profile_id"], skin_id: @@url_info["skin_id"]).delete
        format.html { redirect_to listings_path, notice: 'Listing was successfully created.' }
        format.json { render :index, status: :created, location: @@url_info["profile_id"] }
      else     
        @profile_id = @@url_info[:profile_id] 
        @skin_id = @@url_info[:skin_id] 
        format.html { redirect_to new_listing_path(@@url_info["profile_id"], @@url_info["skin_id"]), notice: 'Invalid Price'}
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end 
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listings_path , notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else 
        # redirecting with params found throught listing
        format.html {redirect_to edit_listing_path(params[:id],Listing.find(params[:id]).seller_id,Listing.find(params[:id]).skin_id), notice: 'Price Too Low'}  
          
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy  
    # creating an item based off of the pervious listing data
    Item.create(profile_id:@current_profile, skin_id: Listing.find(params[:id]).skin_id) 
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully deleted, back in your inventory now :).' }
      format.json { head :no_content }
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:selling_price)
    end 

    def profile_check  
      if current_user
        @current_profile = Profile.find_by(user_id: current_user).id 
      end  
    end
end
