class Backoffice::Website::Contents::ManpagesController < Backoffice2lController
  # ::Rails.logger.error("...")

  #cache_sweeper :manpage_sweeper



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @manpage_filter = ManpageFilter.new(params[:manpage_filter])
    @manpages = Manpage.paginate :include => [:parent], :conditions => @manpage_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @manpage = Manpage.new
  end



  def create
    @manpage = Manpage.new(params[:manpage])
    if @manpage.save
      flash[:notice] = I18n.t("activeview.flashes.manpage.notices.created")
      redirect_to :action => "edit", :id => @manpage.id
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @manpage = Manpage.find(params[:id])
  end



  def update
    @manpage = Manpage.find(params[:id])
    if @manpage.update_attributes(params[:manpage])
      flash[:notice] = I18n.t("activeview.flashes.manpage.notices.updated")
      redirect_to :action => "edit", :id => @manpage.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Manpage.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.manpage.notices.deleted")
    redirect_to :action => "index"
  end



  def export
    result = ""
    cast_ids_to_i(params).each do |id|
      manpage = Manpage.find_by_id(id)
      next if manpage.nil?
      result += manpage.name + "\r\n" if ids.size() > 1
      result += manpage.content
      result += "\r\n\r\n\r\n" if ids.size() > 1
    end

    send_data(result,:filename => "content.txt",
      :type => "txt/txt", :disposition => "inline")
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @parents =  ([Manpage.new] + Manpage.find(:all))
  end

end
