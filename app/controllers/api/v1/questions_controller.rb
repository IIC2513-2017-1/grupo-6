module Api::V1
  class QuestionsController < ApiController
    before_action :authenticate
    
    def index
      @questions = Question.all
    end

    def show
      @question = Question.includes(:answers, :user).find(params[:id])
    end

    def create
      @question = @current_user.questions.build(question_params)
      if @question.save
        render 'api/v1/questions/show'
      else
        render json: { errors: @question.errors }, status: :unprocessable_enitity
      end
    end

    private

    def question_params
      params.require(:question).permit(:content, :product_id)
    end
  end
end
