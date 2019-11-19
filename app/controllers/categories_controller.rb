class CategoriesController < ApplicationController

  def index
    @categories = Category.all.page(params[:page]).per(4)
  end

  def show
    @category = Category.find(params[:id])
    @groups = @category.groups
    #  そして、そのidを定義したuserにcategory.groupsとするとそのカテゴリーのグループ一覧という意になる。
    # これはアソシエーションを利用しcategory.groupsとすることで、そのカテゴリーが保有するグループを取得している
    # 他のファイルで使いたいため＠categoryで変数化
  end

end
