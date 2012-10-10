class Backoffice::Promotions::ContactsController < BackofficeController
  #::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    if params[:contact_filter]
      @contact_filter = ContactFilter.new(params[:contact_filter])
      @search = Contact.find_by_filter(params[:contact_filter])
      @contacts = @search.paginate :page => params[:page], :order => @orderby
    else
      @contact_filter = ContactFilter.new
      @contacts = Contact.paginate :page => params[:page], :order => @orderby
    end
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      @notice = "contact was succesfully created."
      render :action => "edit"
    else
      @error = "contact was succesfully created."
    end
  end


  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      @notice = "contact was succesfully updated."
      render :action => "edit"
    else
      @error = "contact wasn't succesfully created."
    end
  end

  def destroy
    Contact.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.contact.notices.deleted")
    redirect_to :action => "index"
  end
end
