module V1
  class CrackingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_crackings, except: :create
    before_action :set_cracking, only: [:show, :update, :destroy]

    # GET /crackings
    def index
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

    # GET /crackings/find
    def find
      cracking = @crackings.find_by_paper_id(params[:paper_id])
      render json: cracking
    end

    private
    def set_crackings
      # @crackings = Cracking.where(:user_id => current_user.id)
      @crackings = current_user.crackings
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_cracking
      @cracking = @crackings.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cracking_params
      params.permit(:current_question, :paper_id).merge(
          user_id: current_user.id
      )
    end
  end
end