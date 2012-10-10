class Framework::Constants::PatternTypesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @pattern_type_filter = PatternTypeFilter.new(params[:pattern_type_filter])
    @pattern_types = PatternType.paginate :conditions => @pattern_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @pattern_type = PatternType.new
  end



  def create
    @pattern_type = PatternType.new(params[:pattern_type])
    if @pattern_type.save
      flash[:notice] = I18n.t("pattern_type.flash.notices.created")
      redirect_to :action => "edit", :id => @pattern_type.id
    else
      render :action => "new"
    end
  end


  def edit
    @pattern_type = PatternType.find(params[:id])
  end



  def update
    @pattern_type = PatternType.find(params[:id])
    if @pattern_type.update_attributes(params[:pattern_type])
      flash[:notice] = I18n.t("pattern_type.flash.notices.updated")
      redirect_to :action => "edit", :id => @pattern_type.id
    else
      render :action => "edit"
    end
  end



  def destroy
    cast_ids_to_i(params).each do |id|
      begin
        PatternType.destroy(cast_ids_to_i(params))
      rescue ActiveRecord::StatementInvalid
        # It's OK, record wasn't deleted due to fk
        flash[:warning] = I18n.t("activeview.flashes.pattern_type.warnings.skipped")
      end
    end
    flash[:notice] = I18n.t("activeview.flashes.pattern_type.notices.deleted")
    redirect_to :action => "index"
  end
end
