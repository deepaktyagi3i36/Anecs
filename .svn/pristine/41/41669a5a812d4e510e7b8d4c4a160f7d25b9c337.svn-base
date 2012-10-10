class Backoffice::Website::Feedbacks::ComplaintsController < Backoffice2lController
  # ::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "complaints.created_at"

    # Load data for fitlers
    @complaint_types_filter =  ([ComplaintType.new] + ComplaintType.find(:all, :order => "name"))
    @complaint_statuses_filter =  ([ComplaintStatus.new] + ComplaintStatus.find(:all, :order => "name"))


    # Process filtering
    @complaint_filter = ComplaintFilter.new(params[:complaint_filter])
    @complaints = Complaint.paginate :conditions => @complaint_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @complaint = Complaint.new(:complaint_type_id => @complaint_type.id)
  end



  def create
    @complaint = Complaint.new(params[:complaint])
    if @complaint.save
      flash[:notice] = I18n.t("complaints.flash.notices.created")
      redirect_to :action => "edit", :id => @complaint
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @complaint = Complaint.find(params[:id])
  end



  def update
    @complaint = Complaint.find(params[:id])
    if @complaint.update_attributes(params[:complaint])
      flash[:notice] = I18n.t("complaints.flash.notices.updated")
      redirect_to :action => "edit", :id => @complaint
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Complaint.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.complaint.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @complaint_types = ComplaintType.find(:all, :order => "name")
    @complaint_statuses = ComplaintStatus.find(:all, :order => "name")
    @users = User.find(:all, :order => "login")
    @complaint_type = ComplaintType.find_by_code("order")
  end

end
