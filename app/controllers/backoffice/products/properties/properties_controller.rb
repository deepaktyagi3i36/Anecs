class Backoffice::Products::Properties::PropertiesController < Backoffice2lController
  # ::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "properties.name"

    # Load data for fitlers
    @datatypes_filter =  ([Datatype.new] + Datatype.find(:all))

    # Process filtering
    @property_filter = PropertyFilter.new(params[:property_filter])
    @properties = Property.paginate :include => [:datatype],
                                    :conditions => @property_filter.conditions(@website),
                                    :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    load_data
    @property = Property.new()
  end

  def create
    @property = Property.new(params[:property].merge(:website_id => @website.id))
    if @property.save
      flash[:notice] = I18n.t("activeview.flashes.property.notices.created")
      redirect_to :action => "edit", :id => @property.id
    else
      load_data
      render :action => "new"
    end
  end

  def edit
    load_data
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(params[:property])
      flash[:notice] = I18n.t("activeview.flashes.property.notices.updated")
      redirect_to :action => "edit", :id => @property.id
    else
      load_data
      render :action => "edit"
    end
  end

  def destroy
    Property.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.property.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @datatypes = Datatype.find(:all, :order => "name")
  end
end
