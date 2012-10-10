class Framework::Constants::PromotionTypesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @promotion_type_filter = PromotionTypeFilter.new(params[:promotion_type_filter])
    @promotion_types = PromotionType.paginate :conditions => @promotion_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @promotion_type = PromotionType.new
  end



  def create
    @promotion_type = PromotionType.new(params[:promotion_type])
    if @promotion_type.save
      flash[:notice] = I18n.t("activeview.flashes.promotion_type.notices.created")
      redirect_to :action => "edit", :id => @promotion_type.id
    else
      render :action => "new"
    end
  end


  def edit
    @promotion_type = PromotionType.find(params[:id])
  end



  def update
    @promotion_type = PromotionType.find(params[:id])
    if @promotion_type.update_attributes(params[:promotion_type])
      flash[:notice] = I18n.t("activeview.flashes.promotion_type.notices.updated")
      redirect_to :action => "edit", :id => @promotion_type.id
    else
      render :action => "edit"
    end
  end



  def destroy
    cast_ids_to_i(params).each do |id|
      begin
        PromotionType.destroy(cast_ids_to_i(params))
      rescue ActiveRecord::StatementInvalid
        # It's OK, record wasn't deleted due to fk
        flash[:warning] = I18n.t("activeview.flashes.promotion_type.warnings.skipped")
      end
    end
    flash[:notice] = I18n.t("activeview.flashes.promotion_type.notices.deleted")
    redirect_to :action => "index"
  end
end
