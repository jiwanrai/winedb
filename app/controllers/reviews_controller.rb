class ReviewsController < ApplicationController
  def new
    @wine = Wine.find(params[:wine_id])
    @review = @wine.reviews.new
  end

  def create
    @wine = Wine.find(params[:review][:wine_id])
    @review = @wine.reviews.create(review_params)
    if @review.save
      redirect_to @wine
    else
      render 'new'
    end
  end

  def update
    @review = Review.find(params[:id])
    @wine = Wine.find(@review.wine_id)
    if @review.update(review_params)
      redirect_to @wine
    else
      render 'edit'
    end
  end

  def show
    @review = Review.find(params[:id])
    @wine = @review.wine
  end

  def index
    @reviews = Review.all
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    @wine = Wine.find(Review.find(params[:id]).wine_id)
    @review = Review.find(params[:id]).destroy
    redirect_to @wine
  end

  private

    def review_params
      params.require(:review).permit(:wine_id,:review,:rating,:buy_again,:user_id)
    end
end
