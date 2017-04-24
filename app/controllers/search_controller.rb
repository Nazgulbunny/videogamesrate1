class SearchController < ApplicationController
  def index
    if params[:search]
      @users = User.search(params[:search])
      @events = Event.search(params[:search])
      @games = Game.search(params[:search])
    end
  end
end
