class Backoffice::Website::Feedbacks::FeedbacksController < Backoffice2lController
  # ::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "feedbacks.created_at"

    # Load data for fitlers
    @contact_types_filter =  ([ContactType.new] + ContactType.find(:all, :order => "name"))
    @contact_statuses_filter =  ([ContactStatus.new] + ContactStatus.find(:all, :order => "name"))


    # Process filtering
    @feedback_filter = FeedbackFilter.new(params[:feedback_filter])
    @feedbacks = Feedback.paginate :conditions => @feedback_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @feedback = Feedback.new()
  end



  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      flash[:notice] = I18n.t("feedbacks.flash.notices.created")
      redirect_to :action => "edit", :id => @feedback
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @feedback = Feedback.find(params[:id])
  end



  def update
    @feedback = Feedback.find(params[:id])
    if @feedback.update_attributes(params[:feedback])
      flash[:notice] = I18n.t("feedbacks.flash.notices.updated")
      redirect_to :action => "edit", :id => @feedback
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Feedback.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.feedback.notices.deleted")
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
