class CrackedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_crackeds, except: :create
  before_action :set_cracked, only: [:show, :update, :destroy]

  # GET /crackeds
  def index
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
      delete_corresponding_cracking @cracked
      render json: @cracked, status: :created#, location: @cracked
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
    def set_crackeds
      # @crackeds = Cracked.where(:user_id => current_user.id)
      @crackeds = current_user.crackeds
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_cracked
      @cracked = @crackeds.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cracked_params
      params.require(:cracked).permit(:paper_id).merge(
          user_id: current_user.id
      )
    end

    def delete_corresponding_cracking(cracked)
      cracking = Cracking.find_by_user_id_and_paper_id(cracked.user_id, cracked.paper_id)
      cracking.destroy
    end
end
