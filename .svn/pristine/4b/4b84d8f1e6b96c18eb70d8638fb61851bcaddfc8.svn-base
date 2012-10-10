class Framework::Settings::StatesController < FrameworkController
  #::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @state_filter = StateFilter.new(params[:state_filter])
    @states = State.paginate :conditions => @state_filter.conditions,
      :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    @state = State.new
  end

  def create
    @state = State.new(params[:state])
    if @state.save
      flash[:notice] = I18n.t("states.flash.notices.created")
      redirect_to :action => "edit", :id => @state.id
    else
      render :action => "new"
    end
  end

  def edit
    @state = State.find(params[:id])
  end

  def update
    @state = State.find(params[:id])
    if @state.update_attributes(params[:state])
      flash[:notice] = I18n.t("states.flash.notices.updated")
      redirect_to :action => "edit", :id => @state.id
    else
      render :action => "edit"
    end
  end

  def destroy
    State.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.state.notices.deleted")
    redirect_to :action => "index"
  end
end
