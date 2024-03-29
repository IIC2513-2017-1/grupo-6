class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    return unless authenticated_admin?
    @reviews = Review.includes(:product).all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @product_id = params[:product_id]
  end

  # GET /reviews/1/edit
  def edit
    return unless has_edit_permission?(@review)
  end

  # POST /reviews
  # POST /reviews.json
  def create
    return unless authenticated_login?
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.product, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
        format.js
      else
        format.html { redirect_to @review.product }
        format.json { render json: @review.errors, status: :unprocessable_entity }
        format.js { redirect_to @review.product }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    return unless has_edit_permission?(@review)
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    return unless has_edit_permission?(@review)
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content, :score, :product_id)
    end
end
