class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to answers_path, success: t('defaults.message.created', item: Question.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Question.model_name.human)
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
