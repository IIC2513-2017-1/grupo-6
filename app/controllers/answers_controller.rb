class AnswersController < ApplicationController
  before_action :set_answer, only: %i[show edit update destroy]
  
  # GET /answers
  # GET /answers.json
  def index
    return unless authenticated_admin?
    @answers = Answer.includes(question: :product).all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show; end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
    return unless has_edit_permission?(@answer)
  end

  # POST /answers
  # POST /answers.json
  def create
    return unless authenticated_login?
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
        format.js
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    return unless has_edit_permission?(@answer)
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    return unless has_edit_permission?(@answer)
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end