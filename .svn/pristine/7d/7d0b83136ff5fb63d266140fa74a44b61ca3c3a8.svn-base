class ProductsController < ApplicationController
  #::Rails.logger.error("...")
  #layout "products"
  layout Proc.new { |controller|
    parameters = controller.request.filtered_parameters
    parameters && parameters["layout"] ? parameters["layout"] : "products"
  }
  include ProductsMethods

  # Include extra helpers
  helper 'products'

  # Include filters
  # before_filter :load_data
  before_filter :check_category
  before_filter :check_product, :only => :show

  def index
		# Load category
		@category = Category.find_by_id(params["category"].to_i)

    # Get options from request or default
    @orderby_options = get_orderby_options
    @itemsonpage_options = get_itemsonpage_options
    @orderby = params['orderby'] || 'name'
    @itemsonpage = params['itemsonpage'] || '10'

    # Find all product in current category according to region settings
    @products = Product.paginate :include => [:connections],
                                 :conditions => ProductFilter.by_category_conditions(@category, @region),
                                 :page => params[:page], :per_page => @itemsonpage, :order => @orderby

    # Create a breadcrumbs
    add_breadcrumbs_by_path
  end

  def show
		# Load category and product
		@category = Category.find_by_id(params["category"].to_i)
    @product = Product.find(params[:product].to_i, :include => [:connections],
                            :conditions => ProductFilter.by_category_conditions(@category, @region))

    # Create a breadcrumbs
    add_breadcrumbs_by_path
    set_breadcrumb_for @product
  end

  protected
  # Return predefined order by options
  def get_orderby_options
    [[I18n.t("sorting.options.by_name"), 'name'],
      #[I18n.t("sorting.options.by_rating"), 'rating desc'],
    ];
  end

  def get_itemsonpage_options
    [['2', '2'], ['5', '5'], ['10', '10'], ['20', '20'], ['30', '30']]
  end

end
