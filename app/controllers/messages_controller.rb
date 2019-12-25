class MessagesController < ApplicationController
  # before_action :set_category, :set_group, only: [:create]


  def index
    @messages = Message.includes(:current_user)
  end

  def create
    @message = Message.create(message_params)
    # このcreateができた時点でMessageにcategoryとgroupが紐づいているのでそれを変数化して下で利用。
    respond_to do |format|
      format.html { redirect_to "/categories/#{@message.group.category.id}/groups/#{@message.group.id}", notice: "メッセージを送信しました" }
      format.json
    end
  end
end


private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, group_id: params[:group_id])
  end
