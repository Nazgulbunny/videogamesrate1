class HomeController < ApplicationController
  before_action :set_user, except: :front
  layout :set_layout
  respond_to :html, :js

  def about
  end

  def index
    @post = Post.new
    @friends = @user.all_following.unshift(@user)
    @activities = PublicActivity::Activity.where(owner_id: @friends).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def front
    @videos = Video.order( "cached_votes_up DESC" ).limit(3).all
  end

  def find_friends
    @friends = @user.all_following
    @users =  User.where.not(id: @friends.unshift(@user)).paginate(page: params[:page])
  end

  def top_videos
    @videos = Video.order( "cached_votes_up DESC" )
  end

private
  def set_user
    @user = current_user
  end

  def set_layout
    return "front" if action_name.in? ["front", "top_videos"]
    return "application"
  end
end
