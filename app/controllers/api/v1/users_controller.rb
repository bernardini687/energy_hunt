class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # GET /users/:id
  def show
    render json: @user
  end

  def update; end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit :email, :password
  end
end
