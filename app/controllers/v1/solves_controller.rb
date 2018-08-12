module V1
  class SolvesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_solves, only: :index
    before_action :set_solve, only: [:show, :update, :destroy]

    # GET /solves
    def index
      render json: @solves
    end

    # GET /solves/1
    def show
      render json: @solve
    end

    # POST /solves
    def create
      @solve = Solve.new(solve_params)

      if @solve.save
        render json: @solve, status: :created#, location: @solve
      else
        render json: @solve.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /solves/1
    def update
      if @solve.update(solve_params)
        render json: @solve
      else
        render json: @solve.errors, status: :unprocessable_entity
      end
    end

    # DELETE /solves/1
    def destroy
      @solve.destroy
    end

    private
    def set_solves
      # paper = Paper.find(params[:paper_id]) if current_user.purchases.find_by_paper_id(params[:paper_id])
      # @solves = Solve.where("user_id = ? AND question_id IN (?)", current_user.id, paper.question_ids) if paper
      @solves = current_user.solves
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_solve
      # @solve = Solve.where(:user_id => current_user.id).find(params[:id])
      @solve = @solves.find(params[:id])
    end


    # Only allow a trusted parameter "white list" through.
    def solve_params
      params.permit(:question_id).merge(
          user_id: current_user.id
      )
    end
  end
end