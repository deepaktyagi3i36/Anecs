class Backoffice::Products::Products::VariantsController < Backoffice2lController
  # ::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "variants.name"

    # Load data for fitlers
    @products_filter =  ([Product.new] + Product.find(:all))

    # Process filtering
    @variant_filter = VariantFilter.new(params[:variant_filter])
    @variants = Variant.paginate :include => [:product],:conditions => @variant_filter.conditions(@website),
                                 :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    load_data
    @variant = Variant.new()
  end

  def create
    @variant = Variant.new(params[:variant])
    if @variant.save
      flash[:notice] = I18n.t("activeview.flashes.variant.notices.created")
      redirect_to :action => "edit", :id => @variant
    else
      load_data
      render :action => "new"
    end
  end

  def edit
    load_data
    @variant = Variant.find(params[:id])
  end

  def update
    @variant = Variant.find(params[:id])
    if @variant.update_attributes(params[:variant])
      flash[:notice] = I18n.t("activeview.flashes.variant.notices.updated")
      redirect_to :action => "edit", :id => @variant
    else
      load_data
      render :action => "edit"
    end
  end

  def destroy
    cast_ids_to_i(params).each do |id|
      begin
        Variant.destroy(cast_ids_to_i(params))
      rescue ActiveRecord::StatementInvalid
        # It's OK, record wasn't deleted due to fk
        flash[:warning] = I18n.t("activeview.flashes.variant.warnings.skipped")
      end
    end
    flash[:notice] = I18n.t("activeview.flashes.variant.noticesdeleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @products = Product.find(:all, :conditions => ProductFilter.website_conditions(@website), :order => "name")
    @currencies = Currency.find_all_by_enabled(1, :order => "name")
  end
end
