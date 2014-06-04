class WinesController < ApplicationController
  def new
    @wine = Wine.new
    @price = @wine.build_price
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def edit
    @wine = Wine.find(params[:id])
    @price = @wine.price
  end

  def create
    @wine = Wine.new(user_params)
    if @wine.save
      @price = @wine.create_price(price_params)
      redirect_to @wine
    else
      render 'new'
    end
  end

  def update
    @wine = Wine.find(params[:id])

    if @wine.update(user_params)
      @price = @wine.price.update(price_params)
      redirect_to @wine
    else
      render 'edit'
    end
  end

  def index
    if params[:search]
      @wines = Wine.search(params[:search]).order("created_at DESC")
    else
      @wines = Wine.order("created_at DESC")
    end
  end

  def destroy
    Wine.find(params[:id]).destroy
    flash[:success] = "Wine deleted."
    redirect_to wines_url
  end

  private

    def user_params
      params.require(:wine).permit(:name, :link, :vintage, :country_id, :region_id, :purchased_from, :appellation_id, :picture, :date_consumed, :description, :grape_ids => [])
    end
    def price_params
      params.require(:price).permit(:amount, :currency_id, :wine_id)
    end
end
