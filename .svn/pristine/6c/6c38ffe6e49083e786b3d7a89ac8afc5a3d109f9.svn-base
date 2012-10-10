class Products::BookcasesController < ApplicationController
  #::Rails.logger.error("...")
  layout "products"

  # Include extra helpers
  helper 'products'

  # Include filters
  # before_filter :load_data
  # before_filter :load_product

  def index
    @product = Product.find(params[:product_id].to_i,
      :conditions => ProductFilter.product_by_category_conditions(@category, @region))

    @manufacturer_category = get_category_with_infoitem_type(@product.manufacturer_category)
    # Find all articles related to product
    @articles = @product.bookcases
    set_breadcrumb_for @product
    add_breadcrumb t('navigation.breadcrumbs.bookcases'), @product.url.sub('/product/', '/product/articles/')
  end

  def show
    @product = Product.find(params[:product_id].to_i,
      :conditions => ProductFilter.product_by_category_conditions(@category, @region))

    @manufacturer_category = get_category_with_infoitem_type(@product.manufacturer_category)
    @article = Article.find_by_id(params[:article])
    set_breadcrumb_for @product
    add_breadcrumb t('navigation.breadcrumbs.bookcases'), @product.url.sub('/product/', '/product/articles/')
  end

end
