class CountriesController < ApplicationController
  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)

    if @country.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @country
    else
      render 'new'
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])

    if @country.update(country_params)
      redirect_to @country
    else
      render 'edit'
    end
  end

  def index
    @countries = Country.all
  end


  def show
    @country = Country.find(params[:id])
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name, :description)
    end
end
