class ConsumedWinesController < ApplicationController

  before_action :signed_in_user, only: [:new, :create, :edit, :update]

  def new
    @consumed_wine = ConsumedWine.new(wine_id: params[:wine_id])
  end

  def create
    @consumed_wine = ConsumedWine.new(consumed_wine_params)
    if @consumed_wine.save
      redirect_to consumed_wines_url
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @consumed_wine = ConsumedWine.find(params[:id])
  end

  def index
    @consumed_wines = current_user.consumed_wines
  end

  private
    def consumed_wine_params
      params.require(:consumed_wine).permit(:user_id, :wine_id, :currency_id, :price, :date_consumed, :purchased_from, :form, :review, :rating)
    end

    # Before filters

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
