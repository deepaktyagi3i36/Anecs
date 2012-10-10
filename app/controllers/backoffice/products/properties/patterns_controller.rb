class Backoffice::Products::Properties::PatternsController < Backoffice2lController
  # ::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "patterns.name"

    # Process filtering
    @pattern_filter = PatternFilter.new(params[:pattern_filter])
    @patterns = Pattern.paginate :conditions => @pattern_filter.instruction_conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @pattern = Pattern.new(:pattern_type_id => @pattern_type.id)
  end



  def create
    @pattern = Pattern.new(params[:pattern])
    if @pattern.save
      flash[:notice] = I18n.t("patterns.flash.notices.created")
      redirect_to :action => "edit", :id => @pattern
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @pattern = Pattern.find(params[:id])
  end



  def update
    @pattern = Pattern.find(params[:id])
    if @pattern.update_attributes(params[:pattern])
      flash[:notice] = I18n.t("patterns.flash.notices.updated")
      redirect_to :action => "edit", :id => @pattern
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Pattern.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.pattern.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @pattern_types = PatternType.find(:all, :order => "name")
    @pattern_type = PatternType.find_by_code("instructions")
  end

end
