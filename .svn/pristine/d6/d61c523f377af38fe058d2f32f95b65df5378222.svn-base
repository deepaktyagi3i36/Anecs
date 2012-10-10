class Backoffice::Settings::LanguagesController < BackofficeController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @language_filter = LanguageFilter.new(params[:language_filter])
    @languages = Language.paginate :conditions => @language_filter.conditions,
        :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @language = Language.new
  end



  def create
    @language = Language.new(params[:language])
    if @language.save
      flash[:notice] = I18n.t("activeview.flashes.language.notices.created")
      redirect_to :action => "edit", :id => @language.id
    else
      render :action => "new"
    end
  end


  def edit
    @language = Language.find(params[:id])
  end



  def update
    @language = Language.find(params[:id])
    if @language.update_attributes(params[:language])
      flash[:notice] = I18n.t("activeview.flashes.language.notices.updated")
      redirect_to :action => "edit", :id => @language.id
    else
      render :action => "edit"
    end
  end

  def enable
    ids = cast_ids_to_i(params)
    ids.each do |id|
      language = Language.find(id)
      if language.update_attribute(:enabled, 1)
        flash[:notice] = I18n.t("activeview.flashes.language.notices.updated")
      end
    end
    redirect_to :action => :index
  end

  def disable
    ids = cast_ids_to_i(params)
    ids.each do |id|
      language = Language.find(id)
      if language.update_attribute(:enabled, 0)
        flash[:notice] = I18n.t("activeview.flashes.language.notices.updated")
      end
    end
    redirect_to :action => :index
  end



  def destroy
    Language.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.language.notices.deleted")
    redirect_to :action => "index"
  end
end
