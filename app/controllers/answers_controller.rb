class AnswersController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(answer_params)
    @question = Question.find(params[:question_id])
    if @answer.save
      redirect_to questions_path, success: t('defaults.message.created', item: Answer.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Answer.model_name.human)
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body).merge(question_id: params[:question_id])
  end
end
