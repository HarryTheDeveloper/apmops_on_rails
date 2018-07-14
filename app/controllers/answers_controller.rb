class AnswersController < ApplicationController
  before_action :set_question, only: [:index, :create]
  before_action :set_answer, only: [:show, :update, :destroy]

  # GET /answers
  def index
    @answers = [@question.answer]

    render json: @answers
  end

  # GET /answers/1
  def show
    render json: @answer
  end

  # POST /answers
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      @question.answer = @answer
      render json: @answer, status: :created, location: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
  end

  private
    def set_question
      @question = Question.find(params[:question_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params.require(:answer).permit(:type, :int_ans, :flt_ans, :str_ans, :question_id)
    end
end
