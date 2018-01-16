class MessagesController < ApplicationController
  before_action :set_group, only:[:index, :create]
  before_action :set_messages, only:[:index, :create]

  def index
    @user = current_user
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(params[:group_id])
    else
      render :index, notice: 'メッセージを入力してください'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :created_at).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages.includes(:user)
  end

end
