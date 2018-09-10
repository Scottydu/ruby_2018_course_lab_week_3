class UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user_decorator = UserDecorator.new(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
