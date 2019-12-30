class UsersController < ApplicationController
  before_action :set_user, only:[:move_to_index, :show]
  before_action :move_to_index, only:[:show]

  def index
  end
  
  def show
    @groups = @user.groups
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    current_user.update(user_params)
      redirect_to  edit_user_path
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? && current_user.id == @user.id
  end

  def set_user
    @user = User.find(params[:id])
  end
end

private

def user_params
  params.require(:user).permit(:name, :image)
end
