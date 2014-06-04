class RegionsController < ApplicationController
  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)

    if @region.save
      redirect_to @region
    else
      render 'new'
    end
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])

    if @region.update(region_params)
      redirect_to @region
    else
      render 'edit'
    end
  end

  def show
    @region = Region.find(params[:id])
  end

  def index
    @regions = Region.all
  end

  private

    def region_params
      params.require(:region).permit(:country_id, :name, :description)
    end

end
