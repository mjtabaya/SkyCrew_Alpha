class WeaponsController < ApplicationController
  before_action :set_weapon, only: %i[show edit update destroy]

  # GET /weapons
  # GET /weapons.json
  def index
    @weapons = Weapon.all
  end

  # GET /weapons/1
  # GET /weapons/1.json
  def show
    @weapon = Weapon.find(params[:id])
  end

  # GET /weapons/new
  def new
    @weapon = Weapon.new
  end

  def add_arsenal
    @captain = Captain.find params[:captain_id]
    @weapon = Weapon.find params[:weapon_id]
    @arsenal = Arsenal.new(captain_id: @captain.id, weapon_id: @weapon.id)
    @captain.arsenals << @arsenal
    @weapon.arsenals << @arsenal
    @arsenal.equipped = false
    if @arsenal.save
      message = "#{@weapon.name} was successfully purchased."
      redirect_to @captain, notice: message
    else
      render :new
    end
  end

  def catalog
    @weapons = Weapon.all
    render('catalog')
  end

  # GET /weapons/1/edit
  def edit
  end

  # POST /weapons
  # POST /weapons.json
  def create
    @weapon = Weapon.new(weapon_params)

    respond_to do |format|
      if @weapon.save
        format.html { redirect_to @weapon, notice: 'Weapon was successfully created.' }
        format.json { render :show, status: :created, location: @weapon }
      else
        format.html { render :new }
        format.json { render json: @weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weapons/1
  # PATCH/PUT /weapons/1.json
  def update
    respond_to do |format|
      if @weapon.update(weapon_params)
        format.html { redirect_to @weapon, notice: 'Weapon was successfully updated.' }
        format.json { render :show, status: :ok, location: @weapon }
      else
        format.html { render :edit }
        format.json { render json: @weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weapons/1
  # DELETE /weapons/1.json
  def destroy
    @weapon.destroy
    respond_to do |format|
      format.html { redirect_to weapons_url, notice: 'Weapon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weapon
      @weapon = Weapon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weapon_params
      params.require(:weapon).permit(:name, :description, :weapon_type)
    end
end
