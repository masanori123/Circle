class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to root_path, notice: 'グループを削除しました'
  end

  private
  def group_params
    params.require(:group).permit(:group_name, user_ids: [])
  end

end
