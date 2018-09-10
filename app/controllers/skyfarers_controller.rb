class SkyfarersController < ApplicationController
  before_action :correct_captain,   only: %i[show edit update destroy]
  before_action :set_skyfarer, only: %i[show edit update]
  before_action :set_captain, only: %i[update]
  # GET /skyfarers
  # GET /skyfarers.json
  def index
    @skyfarers = Skyfarer.all
  end

  # GET /skyfarers/1
  # GET /skyfarers/1.json
  def show
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
    set_captain
    @skyfarer.set_stats
    @skyfarer.state = "Healthy"
    if @skyfarer.save
      message = "Skyfarer was successfully created."
      redirect_to current_captain, notice: message
    else
      render :new
    end
  end

  # PATCH/PUT /skyfarers/1
  # PATCH/PUT /skyfarers/1.json
  def update
    @skyfarer.set_stats
    if @skyfarer.update(skyfarer_params)
      message = "Skyfarer was successfully updated."
      redirect_to @skyfarer, notice: message
    else
      render :edit
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

    # Confirms the correct captain.
    def correct_captain
      @captain = Skyfarer.find(params[:id]).captain
      unless current_captain?(@captain)
        flash[:danger] = "Unable to access that."
        redirect_back(fallback_location: root_path)
      end
    end

    # Assigns captain to current skyfarer
    def set_captain
      @skyfarer.captain_id = current_captain.id if current_captain
    end

    # Set limit of recruitment, block multiple thread bypass
    def recruit_skyfarer(skyfarer)
      #num_updated = Captain.where(id: current_captain.id)
      #  .where('num_remaining <= max_recruitments')
      #  .update_all('num_remaining = num_remaining + 1')
#
#      if num_updated == 0
#        raise ActiveRecord::Rollback
#      end
    end

end
