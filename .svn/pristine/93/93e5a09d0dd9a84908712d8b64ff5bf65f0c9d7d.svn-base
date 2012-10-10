class Backoffice::Promotions::PromotionsController < BackofficeController
  # ::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "promotions.name"

    # Process filtering
    @promotion_filter = PromotionFilter.new(params[:promotion_filter])
    @promotions = Promotion.paginate :conditions => @promotion_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @promotion = Promotion.new(:promotion_type_id => @promotion_type.id)
  end



  def create
    @promotion = Promotion.new(params[:promotion])
    if @promotion.save
      flash[:notice] = I18n.t("promotions.flash.notices.created")
      redirect_to :action => "edit", :id => @promotion
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @promotion = Promotion.find(params[:id])
  end



  def update
    @promotion = Promotion.find(params[:id])
    if @promotion.update_attributes(params[:promotion])
      flash[:notice] = I18n.t("promotions.flash.notices.updated")
      redirect_to :action => "edit", :id => @promotion
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Promotion.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.promotion.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @promotion_types = PromotionType.find(:all, :order => "name")
    @promotion_type = @promotion_types[0] if @promotion_types.size > 0
  end

end
