module Api::V1
  class ReviewsController < ApiController
    before_action :authenticate

    def index
      @reviews = Review.all
    end

    def show
      @review = Review.includes(:product, :user).find(params[:id])
    end
  end
end
