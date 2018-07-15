class CrackedsController < ApplicationController
  before_action :set_cracked, only: [:show, :update, :destroy]

  # GET /crackeds
  def index
    @crackeds = Cracked.all

    render json: @crackeds
  end

  # GET /crackeds/1
  def show
    render json: @cracked
  end

  # POST /crackeds
  def create
    @cracked = Cracked.new(cracked_params)

    if @cracked.save
      render json: @cracked, status: :created, location: @cracked
    else
      render json: @cracked.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /crackeds/1
  def update
    if @cracked.update(cracked_params)
      render json: @cracked
    else
      render json: @cracked.errors, status: :unprocessable_entity
    end
  end

  # DELETE /crackeds/1
  def destroy
    @cracked.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cracked
      @cracked = Cracked.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cracked_params
      params.require(:cracked).permit(:user_id, :paper_id)
    end
end
