class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:current_user)
  end
end
