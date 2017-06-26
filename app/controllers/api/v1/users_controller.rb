module Api::V1
  class UsersController < ApiController
    before_action :authenticate

    def show
      @user = User.includes(:reviews, :questions, :answers, :orders).find(@current_user.id)
    end
  end
end
