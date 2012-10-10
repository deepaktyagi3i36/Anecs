class Framework::Constants::DatatypesController < FrameworkController
  #::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @datatype_filter = DatatypeFilter.new(params[:datatype_filter])
    @datatypes = Datatype.paginate :conditions => @datatype_filter.conditions,
      :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    @datatype = Datatype.new
  end

  def create
    @datatype = Datatype.new(params[:datatype])
    if @datatype.save
      flash[:notice] = I18n.t("activeview.flashes.datatype.notices.created")
      redirect_to :action => "edit", :id => @datatype.id
    else
      render :action => "new"
    end
  end

  def edit
    @datatype = Datatype.find(params[:id])
  end

  def update
    @datatype = Datatype.find(params[:id])
    if @datatype.update_attributes(params[:datatype])
      flash[:notice] = I18n.t("activeview.flashes.datatype.notices.updated")
      redirect_to :action => "edit", :id => @datatype.id
    else
      render :action => "edit"
    end
  end

  def destroy
    Datatype.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.datatype.notices.deleted")
    redirect_to :action => "index"
  end
end
