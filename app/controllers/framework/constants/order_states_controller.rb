class Framework::Constants::OrderStatesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    if params[:order_state_filter]
      @order_state_filter = OrderStateFilter.new(params[:order_state_filter])
      @search = OrderState.find_by_filter(@order_state_filter)
      @order_states = @search.paginate :page => params[:page], :order => @orderby
    else
      @order_state_filter = OrderStateFilter.new
      @order_states = OrderState.paginate :page => params[:page], :order => @orderby
    end
  end



  def show
  end



  def new
    @order_state = OrderState.new
  end



  def create
    @order_state = OrderState.new(params[:order_state])
    if @order_state.save
      flash[:notice] = "OrderState was succesfully created."
      redirect_to :action => "edit", :id => @order_state.id
    else
      render :action => "new"
    end
  end


  def edit
    @order_state = OrderState.find(params[:id])
  end



  def update
    @order_state = OrderState.find(params[:id])
    if @order_state.update_attributes(params[:order_state])
      flash[:notice] = "OrderState was succesfully updated."
      redirect_to :action => "edit", :id => @order_state.id
    else
      render :action => "edit"
    end
  end



  def destroy
    OrderState.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.order_state.variant.notices.deleted")
    redirect_to :action => "index"
  end
end
