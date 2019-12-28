class GroupsController < ApplicationController
  before_action :set_category
  
  def new
    @group = Group.new
    # @group.users << current_userと記述することで、現在ログイン中のユーザーを、新規作成したグループに追加しています。
  end
  def create
    group = Group.create(group_params)
    redirect_to "/categories/#{@category.id}", notice: "グループ「#{group.name}」を登録しました。"
  end
  
  def show
    @group = Group.find(params[:id])
    @message = Message.new
    @messages = @group.messages
  end

  private
  def group_params
    params.require(:group).permit(:name).merge(user_ids: [current_user.id], category_id: params[:category_id])
    # createするものに対して（今回はグループ）マージしたいIDがhas manyの関係であればuser_ids: [current_user.id]などでidsとし、[]として引き渡す必要がある。
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

end
