class SkyfarersController < ApplicationController
  before_action :correct_captain,   only: [:show, :edit, :update, :destroy]

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
    @skyfarer = Skyfarer.find(params[:id])
  end

  # POST /skyfarers
  # POST /skyfarers.json
  def create
    @skyfarer = Skyfarer.new(skyfarer_params)

    respond_to do |format|
      @skyfarer.captain_id = current_captain.id if current_captain
      @skyfarer.set_stats
      @skyfarer.state = "Healthy"

      if @skyfarer.save
        format.html { redirect_to current_captain, notice: 'Skyfarer was successfully created.' }
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
      @skyfarer.set_stats
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

    # Confirms the correct captain.
    def correct_captain
      @captain = Skyfarer.find(params[:id]).captain
      unless current_captain?(@captain)
        flash[:danger] = "Unable to access that."
        redirect_back(fallback_location: root_path)
      end
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
