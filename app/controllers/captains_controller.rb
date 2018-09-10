class CaptainsController < ApplicationController
  #before_action :set_captain, only: [:show, :edit, :update, :destroy]
  before_action :correct_captain,   only: [:edit, :update]

  # GET /captains
  # GET /captains.json
  def index
    @captains = Captain.all
  end

  # GET /captains/1
  # GET /captains/1.json
  def show
    skyfarer_chart
    show_captain_skyfarers
    show_captain_weapons
  end

  def show_captain_skyfarers
    set_captain
    @captain.user_id = current_user.id if current_user
    @skyfarers = @captain.skyfarers
  end

  def show_captain_weapons
    @captain = Captain.find(params[:id])
    # @captain.user_id = current_user.id if current_user
    @weapons = @captain.weapons
  end

  # GET /captains/new
  def new
    @captain = Captain.new
  end

  # GET /captains/1/edit
  def edit
  end

  # POST /captains
  # POST /captains.json
  def create
    @captain = Captain.new(captain_params)
    respond_to do |format|
      @captain.user_id = current_user.id if current_user
      if @captain.save
        log_captain @captain
        format.html { redirect_to @captain, notice: 'Captain was successfully created.' }
        format.json { render :show, status: :created, location: @captain }
      else
        format.html { render :new }
        format.json { render json: @captain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /captains/1
  # PATCH/PUT /captains/1.json
  def update
    respond_to do |format|
      if @captain.update(captain_params)
        format.html { redirect_to @captain, notice: 'Captain was successfully updated.' }
        format.json { render :show, status: :ok, location: @captain }
      else
        format.html { render :edit }
        format.json { render json: @captain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /captains/1
  # DELETE /captains/1.json
  def destroy
    @captain.destroy
    respond_to do |format|
      format.html { redirect_to captains_url, notice: 'Captain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_captain
      @captain = Captain.find(params[:id])
    end

    # Confirms the correct captain.
    def correct_captain
      @captain = Captain.find(params[:id])
      unless current_captain?(@captain)
        flash[:danger] = "Unable to access that."
        redirect_to current_captain
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def captain_params
      params.require(:captain).permit(:user_id, :name)
    end

    def skyfarer_chart
      @radarSize = {
        :height => 250,
        :width => 400
      }


      @radarData = {
    		labels: ["Combat", "Tactical", "Support", "Defense"],
    		datasets: [
    			{
    				label: "",
    				fillColor: "rgba(135, 206, 235,0.2)",
    				strokeColor: "black",
    				pointColor: "#87CEEB",
    				pointStrokeColor: "gray",
    				pointHighlightFill: "orange",
    				pointHighlightStroke: "black",
    				data: [helpers.combat_skyfarers.size,
              helpers.tactical_skyfarers.size,
              helpers.support_skyfarers.size,
              helpers.defense_skyfarers.size]
    			}

    			#{
    			#	label: "",
    			#	fillColor: "rgba(151,187,205,0.2)",
    			#	strokeColor: "rgba(151,187,205,1)",
    			#	pointColor: "rgba(151,187,205,1)",
    			#	pointStrokeColor: "#fff",
    			#	pointHighlightFill: "#fff",
    			#	pointHighlightStroke: "rgba(151,187,205,1)",
    			#	data: [28,48,40,19,96,27,100]
    			#}
    		]
    	}.to_json
    end
end
