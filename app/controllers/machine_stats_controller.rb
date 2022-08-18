class MachineStatsController < ApplicationController
  before_action :set_machine_stat, only: %i[ show update destroy ]

  # GET /machine_stats
  def index
    @machine_stats = MachineStat.all

    render json: @machine_stats
  end

  # GET /machine_stats/1
  def show
    render json: @machine_stat
  end

  # POST /machine_stats
  def create
    @machine_stat = MachineStat.new(machine_stat_params)

    if @machine_stat.save
      render json: @machine_stat, status: :created, location: @machine_stat
    else
      render json: @machine_stat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /machine_stats/1
  def update
    if @machine_stat.update(machine_stat_params)
      render json: @machine_stat
    else
      render json: @machine_stat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /machine_stats/1
  def destroy
    @machine_stat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine_stat
      @machine_stat = MachineStat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def machine_stat_params
      params.require(:machine_stat).permit(:sales, :currency, :active_wifi_users, :machine_id)
    end
end
