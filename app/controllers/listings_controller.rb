class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy] 
  before_action :profile_check

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new  
    @@url_info = params
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    
    @listing = Listing.new do |v| 
      v.skin_id = @@url_info["skin_id"] 
      v.seller_id = @@url_info["profile_id"] 
      v.selling_price = params["listing"]["selling_price"]
    end    

    respond_to do |format|
      if @listing.save 
        format.html { redirect_to inventory_path(@@url_info["profile_id"]), notice: 'Listing was successfully created.' }
        format.json { render :index, status: :created, location: @@url_info["profile_id"] }
      else     
        @profile_id = @@url_info[:profile_id] 
        @skin_id = @@url_info[:skin_id] 
        p @profile_id 
        p @skin_id 
        # format.html { render :action => "new" , :profile_id => @profile_id, :skin_id => @skin_id}  
        # render "new", :locals => {:profile_id => @profile_id, :skin_id => @skin_id} 
        # render 'new', locals: { type: 'Monitor' }
        # format.html {render "new"}
        # format.html { redirect_to new_listing_path(@@url_info["profile_id"], @@url_info["skin_id"])} 
        format.json { render json: @listing.errors, status: :unprocessable_entity } 
        p"++++++++++++++++"
        p @listing.errors.full_messages 
        p"++++++++++++++++"
      end 
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
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
