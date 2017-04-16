class GamesController < ApplicationController
  before_action :set_user
  def index
    @games = Game.order('title ASC')
  end

  def show
    @game = Game.find(params[:id])
  end

  private
  def set_user
    @user = current_user
  end
end
