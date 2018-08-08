module V1
  class QuestionsController < ApplicationController
    before_action :authenticate_admin!, only: [:create, :update, :destroy]

    devise_token_auth_group :member, contains: [:user, :admin]
    before_action :authenticate_member!, only: [:index, :show]

    before_action :set_paper, only: [:index, :create]
    before_action :set_question, only: [:show, :update, :destroy]

    # GET    /papers/:paper_id/questions
    def index
      @questions = @paper.questions

      render json: @questions
    end

    # GET /questions/1
    def show
      render json: @question
    end

    # POST   /papers/:paper_id/questions
    def create
      @question = @paper.questions.new(question_params)

      if @question.save
        render json: @question, status: :created, location: @question
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /questions/1
    def update
      if @question.update(question_params)
        render json: @question
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    end

    # DELETE /questions/1
    def destroy
      @question.destroy
    end

    private
    def set_paper
      @paper = Paper.find(params[:paper_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.permit(:number, :content, :difficulty, :question_type, :unit, :mark, :answer, :image, :paper_id)
    end
  end
end