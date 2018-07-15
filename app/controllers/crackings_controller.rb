class CrackingsController < ApplicationController
  before_action :set_cracking, only: [:show, :update, :destroy]

  # GET /crackings
  def index
    @crackings = Cracking.all

    render json: @crackings
  end

  # GET /crackings/1
  def show
    render json: @cracking
  end

  # POST /crackings
  def create
    @cracking = Cracking.new(cracking_params)

    if @cracking.save
      render json: @cracking, status: :created, location: @cracking
    else
      render json: @cracking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /crackings/1
  def update
    if @cracking.update(cracking_params)
      render json: @cracking
    else
      render json: @cracking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /crackings/1
  def destroy
    @cracking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cracking
      @cracking = Cracking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cracking_params
      params.require(:cracking).permit(:current_question, :user_id, :paper_id)
    end
end
