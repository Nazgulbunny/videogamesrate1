class GamesController < ApplicationController
  before_action :set_user
  def index
    @games = Game.order('title ASC')
  end

  def show
    @game = Game.find(params[:id])
    @reviews = Review.where(game_id: @game.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  private
  def set_user
    @user = current_user
  end
end
