class CollectionsController < ApplicationController

  def index
    @wines = current_user.wines
  end
end
