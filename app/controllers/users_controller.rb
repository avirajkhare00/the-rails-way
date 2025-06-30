class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :posts]

  # GET /users
  def index
    users = User.all
    render json: users, status: :ok
  end

  # GET /users/:username
  def show
    if @user
      render json: @user, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  # POST /users
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /users/:username
  def update
    if @user&.update(user_params)
      render json: @user, status: :ok
    else
      render json: { error: 'User not found or update failed' }, status: :not_found
    end
  end

  # DELETE /users/:username
  def destroy
    if @user&.destroy
      render json: { message: 'User deleted' }, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  # GET /users/:username/posts
  def posts
    if @user
      render json: @user.posts, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  private
    def set_user
      @user = User.find_by(username: params[:username])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
