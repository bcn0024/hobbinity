class GroupsController < ApplicationController
  before_action :set_category
  
  def new
    @group = Group.new
    # @group.users << current_userと記述することで、現在ログイン中のユーザーを、新規作成したグループに追加しています。
  end

  # チャットスペースではgroupの中にmessageをネストさせており、messageindexのおいてform内のモデルに＠group＠messageと指定しているが、これはmessageコントローラーにおいて@message = Message.newと @group = Group.find(params[:group_id])が定義されているため、そのグループにメッセージを送ることができる。今回はcategoryの中にgroupをネストさせているがgroupnewにおいてform内のモデルに＠category＠groupと指定しているが、＠categoryは定義されていない。この場合グループを作成するにあたって、どのカテゴリーに属するかが指定できていないのでは？

  def create
    group = Group.create(group_params)
    redirect_to "/categories/#{@category.id}", notice: "グループ「#{group.name}」を登録しました。"  # categoryshow=グループ一覧の詳細画面に遷移する
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
    #  カテゴリーモデルからクリックのあったグループIDを携えたものを変数に代入、これでgroup/viewでも使用可能→before actionへ
  end

end
