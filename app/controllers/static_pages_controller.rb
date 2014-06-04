class StaticPagesController < ApplicationController
  def home

    if signed_in?
      @consumed_wines = current_user.consumed_wines
    end
    if params[:search]
      @wines = Wine.search(params[:search]).order("created_at DESC")
    else
      @wines = Wine.order("created_at DESC")
    end
  end

  def help
  end

  def contact
  end

  def about
  end
end
