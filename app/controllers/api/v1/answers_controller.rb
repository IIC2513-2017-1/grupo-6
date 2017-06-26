module Api::V1
  class AnswersController < ApiController
    before_action :authenticate
    
    def index
      @answers = Answer.all
    end

    def show
      @answer = Answer.includes(:question, :user).find(params[:id])
    end
  end
end
