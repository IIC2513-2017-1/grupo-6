module Api::V1
  class ReviewsController < ApiController
    before_action :authenticate

    def index
      @reviews = Review.all
    end

    def show
      @review = Review.includes(:product, :user).find(params[:id])
    end

    def create
      @review = @current_user.reviews.build(review_params)
      if @review.save
        render 'api/v1/reviews/show'
      else
        render json: { errors: @review.errors }, status: :unprocessable_enitity
      end
    end

    private

    def review_params
      params.require(:review).permit(:content, :score, :product_id)
    end
  end
end
