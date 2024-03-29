class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :show_token, :generate_token]
  before_action :check_permission, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    return unless authenticated_admin?
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit  
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        SignupMailer.signup_mail(@user).deliver_later
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render root_path, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /users/:id/token
  def show_token
    @user.gen_token if @user.token.nil?
  end

  # POST /users/:id/token
  def generate_token
    @user.gen_token
    flash[:notice] = "Successfully generated new token."
    redirect_to show_token_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :username, :name, :last_name, :address, :phone_number, :password, :avatar)
    end

    def check_permission
      if admin? or current_user&.id == @user.id
        return true  
      end
      flash[:alert] = "Permission denied"
      redirect_to root_path
      return false
    end
    
end
