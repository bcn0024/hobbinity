class MessagesController < ApplicationController
  # before_action :set_category, :set_group, only: [:create]


  def index
    @messages = Message.includes(:current_user)
  end

  def create
    @message = Message.create(message_params)
    respond_to do |format|
      format.html { redirect_to "/categories/#{@message.group.category.id}/groups/#{@message.group.id}", notice: "メッセージを送信しました" }
      format.json
    end
  end
end


private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
