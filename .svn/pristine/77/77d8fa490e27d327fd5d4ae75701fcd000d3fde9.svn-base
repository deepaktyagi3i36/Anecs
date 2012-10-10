class Backoffice::Products::Feedbacks::CommentsController < Backoffice2lController
  #::Rails.logger.error("...")




  def index
    # Process sorting
    @orderby = params[:orderby] || "products.name"

    # Load data for fitlers
    @products_filter =  ([Product.new] + Product.find(:all, :order => "name"))
    @users_filter =  ([User.new] + User.find(:all, :order => "login"))
    @comment_types_filter =  ([CommentType.new] + CommentType.find(:all, :order => "name"))
    @comment_statuses_filter =  ([CommentStatus.new] + CommentStatus.find(:all, :order => "name"))

    # Process filtering
    @comment_filter = CommentFilter.new(params[:comment_filter])
    @comments = Comment.paginate :include => [:product, :user],
      :conditions => @comment_filter.product_conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @comment = Comment.new
  end



  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = I18n.t("comments.flash.notices.created")
      redirect_to :action => "edit", :id => @comment.id
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @comment = Comment.find(params[:id])
  end



  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = I18n.t("comments.flash.notices.updated")
      redirect_to :action => "edit", :id => @comment.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Comment.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.comment.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @products = Product.find(:all, :conditions => ProductFilter.website_conditions(@website), :order => "name")
    @comment_types = CommentType.find(:all, :order => "name")
    @comment_statuses = CommentStatus.find(:all, :order => "name")
    @users = User.find(:all, :order => "login")
  end

end
