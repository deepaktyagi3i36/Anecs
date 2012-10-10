class Products::RequestsController < ApplicationController
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
    # Find all requests related to product
    @requests = Request.paginate :conditions => RequestFilter.active_by_product_conditions(@product),
      :page => params[:page], :per_page => @itemsonpage, :order => @orderby
    set_breadcrumb_for @product
    add_breadcrumb t('navigation.breadcrumbs.requests'), @product.url.sub('/product/', '/product/requests/')
  end

  def show
    @product = Product.find(params[:product_id].to_i,
      :conditions => ProductFilter.product_by_category_conditions(@category, @region))

    @manufacturer_category = get_category_with_infoitem_type(@product.manufacturer_category)
    set_breadcrumb_for @product
    add_breadcrumb t('navigation.breadcrumbs.requests'), @product.url.sub('/product/', '/product/requests/')
  end



  def new
    @product = Product.find(params[:product_id].to_i,
      :conditions => ProductFilter.product_by_category_conditions(@category, @region))
    @manufacturer_category = get_category_with_infoitem_type(@product.manufacturer_category)
    @request = Request.new
    set_breadcrumb_for @product
  end


end
