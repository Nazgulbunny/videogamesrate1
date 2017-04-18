class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_game
  before_action :authenticate_user!

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = current_user.reviews.new(review_params)
    @review.game_id = @game.id

    if @review.save
      redirect_to @game, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def show
    @comments = @review.comments.all
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to @game, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_game
      @game = Game.find(params[:game_id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:rating, :comment, :video_review)
    end
end
