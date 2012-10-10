class Backoffice::Products::Feedbacks::RequestsController < Backoffice2lController
  # ::Rails.logger.error("...")




  def index
    # Process sorting
    @orderby = params[:orderby] || "products.name"

    # Load data for fitlers
    @products_filter =  ([Product.new] + Product.find(:all, :order => "name"))
    @request_statuses_filter =  ([RequestStatus.new] + RequestStatus.find(:all, :order => "name"))

    # Process filtering
    @request_filter = RequestFilter.new(params[:request_filter])
    @requests = Request.paginate :include => [:product],
      :conditions => @request_filter.product_conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @request = Request.new
  end



  def create
    @request = Request.new(params[:request])
    if @request.save
      flash[:notice] = I18n.t("requests.flash.notices.created")
      redirect_to :action => "edit", :id => @request.id
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @request = Request.find(params[:id])
  end



  def update
    @request = Request.find(params[:id])
    if @request.update_attributes(params[:request])
      flash[:notice] = I18n.t("requests.flash.notices.updated")
      redirect_to :action => "edit", :id => @request.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Request.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.request.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @products = Product.find(:all, :conditions => ProductFilter.website_conditions(@website), :order => "name")
    @request_statuses = RequestStatus.find(:all, :order => "name")
    @users = User.find(:all, :order => "login")
  end

end
