class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]  
  before_action :only_user, only: [:show, :edit] 
  before_action :profile_check
  def home   
    begin
    if Profile.find_by(user_id: current_user.id) == nil 
      redirect_to new_profile_path
    end 
  rescue 
  end  

  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show  
  @current_user = current_user.id  

  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit   
   
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params) 
    @profile.user_id = current_user.id 
    @profile.wallet = 0.00

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update  
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end 

    def only_user  
      if current_user.id != @profile.user_id 
        redirect_to root_path
      end
    end 

    def profile_check  
      begin 
      if current_user
        @current_profile = Profile.find_by(user_id: current_user).id 
      end 
    rescue 
    end
    end 

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:username, :number, :user_id, :picture, :wallet)
    end
end
