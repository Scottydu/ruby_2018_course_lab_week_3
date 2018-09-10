class Users::FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index]

  def create
    if current_user.friendship_requested.create(receiver: @user)
      session[:notice] = "Friendship created"
      redirect_to user_url(@user)
    else
      session[:alert] = "Error creating the friendship"
      redirect_to user_url(@user)
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
