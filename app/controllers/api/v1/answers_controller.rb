module Api::V1
  class AnswersController < ApiController
    before_action :authenticate
    
    def index
      @answers = Answer.all
    end

    def show
      @answer = Answer.includes(:question, :user).find(params[:id])
    end

    def create
      @answer = @current_user.answers.build(answer_params)
      if @answer.save
        render 'api/v1/answers/show'
      else
        render json: { errors: @answer.errors }, status: :unprocessable_enitity
      end
    end

    private

    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end
  end
end
