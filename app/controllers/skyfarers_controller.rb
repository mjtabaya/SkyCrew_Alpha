class SkyfarersController < ApplicationController
  #before_action :set_skyfarer, only: [:show, :edit, :update, :destroy]

  # GET /skyfarers
  # GET /skyfarers.json
  def index
    @skyfarers = Skyfarer.all
  end

  # GET /skyfarers/1
  # GET /skyfarers/1.json
  def show
    @skyfarer = Skyfarer.find(params[:id])
  end

  # GET /skyfarers/new
  def new
    @skyfarer = Skyfarer.new
  end

  # GET /skyfarers/1/edit
  def edit
  end

  # POST /skyfarers
  # POST /skyfarers.json
  def create
    @skyfarer = Skyfarer.new(skyfarer_params)

    respond_to do |format|
      @skyfarer.captain_id = current_captain.id if current_captain
      puts "--Zoop--"
      puts @skyfarer.captain_id
      puts "--Zeep--"
      stats_for @skyfarer
      @skyfarer.state = "Healthy"
      if @skyfarer.save
        format.html { redirect_to @skyfarer, notice: 'Skyfarer was successfully created.' }
        format.json { render :show, status: :created, location: @skyfarer }
      else
        format.html { render :new }
        format.json { render json: @skyfarer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skyfarers/1
  # PATCH/PUT /skyfarers/1.json
  def update
    respond_to do |format|
      @skyfarer.captain_id = current_captain.id if current_captain
      stats_for @skyfarer
      @skyfarer.state = "Healthy"
      if @skyfarer.update(skyfarer_params)
        format.html { redirect_to @skyfarer, notice: 'Skyfarer was successfully updated.' }
        format.json { render :show, status: :ok, location: @skyfarer }
      else
        format.html { render :edit }
        format.json { render json: @skyfarer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skyfarers/1
  # DELETE /skyfarers/1.json
  def destroy
    @skyfarer.destroy
    respond_to do |format|
      format.html { redirect_to skyfarers_url, notice: 'Skyfarer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skyfarer
      @skyfarer = Skyfarer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skyfarer_params
      params.require(:skyfarer).permit(:captain_id, :name, :race, :profession, :base_attack, :base_defense, :state)
    end

    def stats_for(skyfarer)
      case skyfarer.profession
      when "Fighter"
        skyfarer.base_attack = 5
        skyfarer.base_defense = 5
      when "Thief"
        skyfarer.base_attack = 3
        skyfarer.base_defense = 3
      when "Ranger"
        skyfarer.base_attack = 5
        skyfarer.base_defense = 3
      when "Knight"
        skyfarer.base_attack = 3
        skyfarer.base_defense = 7
      when "Warlock"
        skyfarer.base_attack = 3
        skyfarer.base_defense = 3
      when "Enhancer"
        skyfarer.base_attack = 3
        skyfarer.base_defense = 3
      when "Priest"
        skyfarer.base_attack = 3
        skyfarer.base_defense = 3
      when "Harpist"
        skyfarer.base_attack = 3
        skyfarer.base_defense = 3
      when "Grappler"
        skyfarer.base_attack = 3
        skyfarer.base_defense = 3
      when "Dragoon"
        skyfarer.base_attack = 3
        skyfarer.base_defense = 3
      when "Wizard"
        skyfarer.base_attack = 3
        skyfarer.base_defense = 3
      end
    end

end
