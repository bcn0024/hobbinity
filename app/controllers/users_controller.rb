class UsersController < ApplicationController
  def index
    @groups = Group.includes(:current_user)
  end
end
