class ChatController < ApplicationController
  before_action :set_user, except: :front
  before_action :authenticate_user!

  def index
    session[:conversations] ||= []

    @users = @user.following_users.paginate(page: params[:page])
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end

  private
  def set_user
    @user = current_user
  end

end
