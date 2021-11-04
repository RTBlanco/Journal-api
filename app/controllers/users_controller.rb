class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: :create

  # GET /users
  # def index
  #   @users = User.all

  #   render json: @users
  # end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    binding.pry
    @user = User.new(user_params)

    if @user.save
      @token = encode_token(user_id: @user.id)
      # render json: @user, status: :created, 
      render json: {user: @user, jwt: @token}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render json: @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def user_params
      # params.fetch(:user, {}).permit(:name, :username, :email, :password)
      # params.require(:user).permit(:name, :username, :email, :password)
      params.permit(:name, :username, :email, :password)
    end
end
