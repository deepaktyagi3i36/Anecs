class Backoffice::Website::Feedbacks::PollingsController < Backoffice2lController
  # ::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "title"

    # Process filtering
    if params[:announcement_filter]
      @announcement_filter = AnnouncementFilter.new(params[:announcement_filter])
      @search = Announcement.find_by_filter(params[:announcement_filter])
      @announcements = @search.paginate :page => params[:page], :order => @orderby
    else
      @announcement_filter = AnnouncementFilter.new
      @announcements = Announcement.paginate :page => params[:page], :order => @orderby
    end
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = I18n.t("orders.flash.notices.created")
      redirect_to :action => "edit", :id => @role.id
    else
      #load_data
      render :action => "new"
    end
  end

  def edit
    @order = Order.find(params[:id])

    @search = @order.order_variants
    # @variants = @search.paginate :page => params[:page], :order => @orderby
    @variants = @search.paginate :page => params[:page]
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      flash[:notice] = I18n.t("orders.flash.notices.updated")
      redirect_to :action => "edit", :id => @order.id
    else
      # load_data
      render :action => "edit"
    end
  end

  def destroy
    Order.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.polling.notices.deleted")
    redirect_to :action => "index"
  end

end
