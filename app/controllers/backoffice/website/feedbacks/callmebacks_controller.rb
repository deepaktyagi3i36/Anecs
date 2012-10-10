class Backoffice::Website::Feedbacks::CallmebacksController < Backoffice2lController
  # ::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "callmebacks.created_at"

    # Load data for fitlers
    @contact_types_filter =  ([ContactType.new] + ContactType.find(:all, :order => "name"))
    @contact_statuses_filter =  ([ContactStatus.new] + ContactStatus.find(:all, :order => "name"))


    # Process filtering
    @callmeback_filter = CallmebackFilter.new(params[:callmeback_filter])
    @callmebacks = Callmeback.paginate :conditions => @callmeback_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @callmeback = Callmeback.new()
  end



  def create
    @callmeback = Callmeback.new(params[:callmeback])
    if @callmeback.save
      flash[:notice] = I18n.t("callmebacks.flash.notices.created")
      redirect_to :action => "edit", :id => @callmeback
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @callmeback = Callmeback.find(params[:id])
  end



  def update
    @callmeback = Callmeback.find(params[:id])
    if @callmeback.update_attributes(params[:callmeback])
      flash[:notice] = I18n.t("callmebacks.flash.notices.updated")
      redirect_to :action => "edit", :id => @callmeback
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Callmeback.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.callmeback.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @contact_types = ContactType.find(:all, :order => "name")
    @contact_statuses = ContactStatus.find(:all, :order => "name")
    @users = User.find(:all, :order => "login")
  end

end
