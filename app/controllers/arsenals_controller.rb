class ArsenalsController < ApplicationController
  before_action :set_arsenal, only: %i[show edit update destroy]

  # GET /arsenals
  # GET /arsenals.json
  def index
    @arsenals = Arsenal.all
  end

  # GET /arsenals/1
  # GET /arsenals/1.json
  def show
  end

  # GET /arsenals/new
  def new
    @arsenal = Arsenal.new
  end

  # GET /arsenals/1/edit
  def edit
  end

  # POST /arsenals
  # POST /arsenals.json
  def create
    @arsenal = Arsenal.new(captain_id: current_captain.id, user_id: current_user.id, weapon_id: params[:id])
    @weapons = Weapon.where(weapon_id: params[:id])
    if @arsenal.save
      message = "Arsenal was successfully created."
      redirect_to @arsenal, notice: message
    else
      render :new
    end
  end

  # PATCH/PUT /arsenals/1
  # PATCH/PUT /arsenals/1.json
  def update
    if @arsenal.update(arsenal_params)
      message = "Arsenal was successfully updated."
      redirect_to @arsenal, notice: message
    else
      render :edit
    end
  end

  # DELETE /arsenals/1
  # DELETE /arsenals/1.json
  def destroy
    @arsenal.destroy
    redirect_to arsenals_url, notice: "Arsenal was successfully destroyed."
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_arsenal
    @arsenal = Arsenal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def arsenal_params
    params.require(:arsenal).permit(:captain_id, :skyfarer_id, :weapon_id, :equipped)
  end
end
