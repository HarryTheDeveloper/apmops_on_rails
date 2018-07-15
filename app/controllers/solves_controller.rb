class SolvesController < ApplicationController
  before_action :set_solf, only: [:show, :update, :destroy]

  # GET /solves
  def index
    @solves = Solve.all

    render json: @solves
  end

  # GET /solves/1
  def show
    render json: @solf
  end

  # POST /solves
  def create
    @solf = Solve.new(solf_params)

    if @solf.save
      render json: @solf, status: :created, location: @solf
    else
      render json: @solf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /solves/1
  def update
    if @solf.update(solf_params)
      render json: @solf
    else
      render json: @solf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /solves/1
  def destroy
    @solf.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solf
      @solf = Solve.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def solf_params
      params.require(:solf).permit(:user_id, :question_id)
    end
end
