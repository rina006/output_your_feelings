class AnswersController < ApplicationController
  def index
    @answers = Answer.all.includes(:user).order(created_at: :desc)
  end
  
  def new
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      redirect_to answers_path, success: t('defaults.message.created', item: Answer.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Answer.model_name.human)
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
