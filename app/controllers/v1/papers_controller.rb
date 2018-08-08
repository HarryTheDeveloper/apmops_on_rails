module V1
  class PapersController < ApplicationController
    before_action :authenticate_admin!, only: [:create, :update, :destroy]

    devise_token_auth_group :member, contains: [:user, :admin]
    before_action :authenticate_member!, only: [:index, :show]

    before_action :set_paper, only: [:show, :update, :destroy]

    # GET /papers
    def index
      @papers = Paper.all

      purchases = current_user.purchases

      render json: @papers, each_serializer: PaperSerializer, is_admin: current_user.nil?, purchases: purchases
    end

    # GET /papers/1
    def show
      render json: @paper
    end

    # POST /papers
    def create
      @paper = Paper.new(paper_params)

      if @paper.save
        render json: @paper, status: :created, location: @paper
      else
        render json: @paper.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /papers/1
    def update
      if @paper.update(paper_params)
        render json: @paper
      else
        render json: @paper.errors, status: :unprocessable_entity
      end
    end

    # DELETE /papers/1
    def destroy
      @paper.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def paper_params
      params.permit(:title, :description, :is_paid, :num_questions, :year, :round)
    end
  end
end