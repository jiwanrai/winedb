class AppellationsController < ApplicationController

  def show
    @appellation = Appellation.find(params[:id])
  end

  def new
    @appellation = Appellation.new
  end

  def create
    @appellation = Appellation.new(appellation_params)
    if @appellation.save
      redirect_to @appellation
    else
      render 'new'
    end
  end

  def edit
    @appellation = Appellation.find(params[:id])
  end

  def update
    @appellation = Appellation.find(params[:id])
    if @appellation.update(appellation_params)
      redirect_to @appellation
    else
      render 'edit'
    end
  end

  def index
    @appellations = Appellation.all
  end

  private

    def appellation_params
      params.require(:appellation).permit(:name, :abbreviation, :country_id, :description)
    end
end
