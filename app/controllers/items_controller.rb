class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy] 

  # https://steamcommunity.com/market/listings/730/AWP %7C Hyper Beast %28Field-Tested%29
  
  def api  
    include HTTParty
    base_uri 'https://steamcommunity.com/market/listings/730' 
    def posts  
      self.class.get('/AWP%20%7C%20Hyper%20Beast%20%28Field-Tested%29/render?start=0&count=10&currency=3&language=english&format=json')
    end 
    @hello = Api.new  

  end

  # GET /items
  # GET /items.json
  def index   
    require 'steam.rb'
    @items = Item.all    
    # if the users inventory is empty then make generate invetory appear 
    # even better if u can see if button has been pressed ever make is dissapear
    p $the
    
  end


  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

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
end
