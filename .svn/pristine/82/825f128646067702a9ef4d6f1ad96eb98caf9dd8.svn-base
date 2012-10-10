class Myaccount::Shopping::FavoritesController < MyaccountController
  # ::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "name"
    requested_page = params[:page]
    @favorite_products = @favorites.favorite_products.paginate :page => requested_page, :order => @orderby
    if requested_page.to_i > 1 && @favorite_products.out_of_bounds?
      redir_url = request.url.gsub("page=#{requested_page}", "page=#{@favorite_products.total_pages}")
      redirect_to redir_url
    end
  end

end
