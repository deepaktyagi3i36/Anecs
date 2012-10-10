class FavoritesController < ApplicationController
  # ::Rails.logger.error("...")
  layout "greetings"

  def add_to_favorites
    if params.has_key?(:product_id)
      @favorites.add_infoitem(params[:product_id])
    end
    redirect_to :back
  end

  def remove_from_favorites
    if params.has_key?(:product_id)
      @favorites.remove_infoitem(params[:product_id])
    end
    redirect_to :back
  end

end

