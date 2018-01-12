class CategoriesController < ApplicationController

  def index
    @users = User.order('id ASC').limit(20)
  end

  def search
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
    respond_to do |format|
      format.html
      format.json
    end
  end
end
