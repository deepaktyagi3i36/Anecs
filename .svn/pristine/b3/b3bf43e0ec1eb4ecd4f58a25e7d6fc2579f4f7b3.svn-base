class Backoffice::Products::Products::AgentsController < Backoffice2lController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "product_id"

    # Process filtering
    @agent_filter = AgentFilter.new(params[:agent_filter])
    @agents = Agent.paginate :conditions => @agent_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @category = Category.new
  end



  def create
    @category = Category.new(params[:category])
    if @category.save
      @notice = "Category was succesfully created."
      render :action => "edit"
    else
      @error = "Category was succesfully created."
    end
  end


  def edit
    @category = Category.find(params[:id])
  end



  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      @notice = "Category was succesfully updated."
      render :action => "edit"
    else
      @error = "Category wasn't succesfully created."
    end
  end



  def destroy
    Category.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.bookcase.notices.deleted")
    redirect_to :action => "index"
  end

end
