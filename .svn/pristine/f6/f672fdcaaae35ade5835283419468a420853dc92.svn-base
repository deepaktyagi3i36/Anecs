class Backoffice::Products::Products::InstructionsController < Backoffice2lController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "products.name"

    # Load data for fitlers
    @products_filter =  ([Product.new] + Product.find(:all))

    # Process filtering
    @instruction_filter = InstructionFilter.new(params[:instruction_filter])
    @instructions = Instruction.paginate :include => [:product],
      :conditions => @instruction_filter.product_conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @instruction = Instruction.new()
  end



  def create
    # Create title and body based on pattern
    @instruction = Instruction.new(params[:instruction])
    if !@instruction.pattern_id.nil?
      pattern = Pattern.find_by_id(@instruction.pattern_id)
      @instruction.title = pattern.title if !pattern.nil?
      @instruction.body = pattern.body if !pattern.nil?
      @instruction.position = pattern.name.split('_')[0]
    end

    if @instruction.save
      flash[:notice] = I18n.t("instructions.flash.notices.created")
      redirect_to :action => "edit", :id => @instruction
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @instruction = Instruction.find(params[:id])
  end



  def update
    @instruction = Instruction.find(params[:id])
    if @instruction.update_attributes(params[:instruction])
      flash[:notice] = I18n.t("instructions.flash.notices.updated")
      redirect_to :action => "edit", :id => @instruction
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Instruction.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.instruction.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @products = Product.find(:all, :conditions => ProductFilter.website_conditions(@website))
    @patterns = [Pattern.new()] + Pattern.find(:all, :conditions => PatternFilter.instruction_conditions)
  end

end
