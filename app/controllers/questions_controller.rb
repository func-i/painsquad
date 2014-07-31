class QuestionsController < ApplicationController
  skip_before_action :restrict_access
  before_action :set_question, only: [:edit, :update, :destroy]

  def index
    @full_questions      = Survey.full.first.questions
    @truncated_questions = Survey.truncated.first.questions
  end

  def show
    @question = Question.includes(:choices).find(params[:id])
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :tip)
  end

end
