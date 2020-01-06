class GroupsController < ApplicationController
  before_action :set_category
  
  def new
    @group = Group.new
  end
  def create
    @group = Group.create(group_params)
    redirect_to "/categories/#{@category.id}", notice: "グループ「#{@group.name}」を登録しました。"
    
  end
  # "/categories/#{@category.id}"
  
  def show
    @group = Group.find(params[:id])
    @message = Message.new
    @messages = @group.messages
  end

  def edit
    @group = Group.find(params[:id])
    @group.users << current_user
    redirect_to user_path(current_user.id)
  end

  private

  def group_params
    params.require(:group).permit(:name).merge(user_ids: [current_user.id], category_id: params[:category_id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

end
