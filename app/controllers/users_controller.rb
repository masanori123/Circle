class UsersController < ApplicationController

  before_action :set_user, only: [:index, :edit, :update]

  def index
  end

  def edit
  end

  def update
  end

  def set_user
    # @user = User.find(params[:id])
  end
end
