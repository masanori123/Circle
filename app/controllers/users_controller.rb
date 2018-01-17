class UsersController < ApplicationController

  before_action :set_user, only: [:index, :edit, :update]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(users_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def following
    @title = "フォローリスト"
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @title = "フォロワーリスト"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :image, :team_name, :region, :body, :result)
  end

  def set_user
    @user = User.find(current_user[:id])
  end

end
