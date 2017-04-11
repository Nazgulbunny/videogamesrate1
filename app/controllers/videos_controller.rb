class VideosController < ApplicationController
  before_action :set_user
	before_action :authenticate_user!
	before_action :set_video, only: [:show, :destroy, ]

	def new
		@video = Video.new
	end

	def create
		@video = current_user.videos.new(video_params)

		if @video.save
      redirect_to root_path
    else
      redirect_to root_path, notice: @video.errors.full_messages.first
    end
	end

	def show
		@comments = @video.comments
	end

	def destroy
    @video.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

 private
	 def set_video
		 @video = Video.find(params[:id])
	 end

	 def video_params
		 params.require(:video).permit(:attachment, :description)
	 end

	 def set_user
		 @user = current_user
	 end
end
