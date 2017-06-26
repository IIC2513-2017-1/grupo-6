module Api::V1
  class QuestionsController < ApiController
    before_action :authenticate
    
    def index
      @questions = Question.all
    end

    def show
      @question = Question.includes(:answers, :user).find(params[:id])
    end
  end
end
