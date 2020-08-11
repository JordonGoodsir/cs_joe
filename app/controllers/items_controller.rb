class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy] 
  before_action :profile_check 

  # https://steamcommunity.com/market/listings/730/AWP %7C Hyper Beast %28Field-Tested%29
  
 
  # GET /items
  # GET /items.json
  def index   
    
  # @generate = Item.create(profile_id:@current_profile, skin_id: [*1..Skin.ids.last].sample.to_i) 
  #  for i in 1..20 do
  #  Item.create(profile_id:@current_profile, skin_id: [*1..Skin.ids.last].sample) 
  #  end 
  ids =[] 
  @current_user_skins=[]  

  # finds all of users item ids then pushes them to array
  ids.push(Item.where(profile_id: @current_profile).ids).flatten! 
  
  ids.each do |v|  
  # based off item ids in array it finds relvant skin ids and then pushes to another array
  @current_user_skins.push(Item.find(v).skin_id)  
  end  
  


  end 

  def generate   
    begin 
    # finds the current users profile
    current = Profile.find(@current_profile) 
    current.generated = true 
    current.save
    for i in 1..20   
    # creates 20 random items with users profile id (@current_profile) and 20 sampled skin ids
    Item.create(profile_id: @current_profile, skin_id: [*1..Skin.ids.last].sample) 
    end 
    redirect_to inventory_path(@current_profile) 
    rescue  
    end
  end


  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new 
    # starts the process of a new instance of item whcih can them be saved
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    weapon = %w(P2000 USP-S Glock-18 P250 Five-SeveN Tec-9 CZ75-Auto Dual%20Berettas Desert%20Eagle R8%20Revolver Nova XM1014 MAG-7 Sawed-Off MP9 MAC-10 PP-Bizon MP7 UMP-45 P90 MP5-SD FAMAS Galil AR M4A4 M4A1-S AK-47 AUG SG%20553 SSG%2008 AWP SCAR-20 G3SG1 M249 Negev) 
    wear = %w(Field-Tested Well-Worn Factory%20New Battle-Scarred Minimal%20Wear)  

    # Item.create(skin_name: )

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item 
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:skin_name, :market_price, :profile_id, :listing_id, :rarity, :stat_track)
    end  

  
    def profile_check  
      if current_user 
        # finds the users profile based off of their user_id through current_user
        @current_profile = Profile.find_by(user_id: current_user).id 
      end  
    end

end
