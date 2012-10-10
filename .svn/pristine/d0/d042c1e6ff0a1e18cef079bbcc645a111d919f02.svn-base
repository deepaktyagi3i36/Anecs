class Backoffice::Website::Contents::VacanciesController < Backoffice2lController
  # ::Rails.logger.error("...")

  #cache_sweeper :article_sweeper
  


  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Load data for fitlers
    @regions_filter =  ([Region.new] + Region.find(:all, :order => "name"))

    # Process filtering
    @vacancy_filter = VacancyFilter.new(params[:vacancy_filter])
    @vacancies = Vacancy.paginate :include => [:region], :conditions => @vacancy_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @vacancy = Vacancy.new()
  end



  def create
    @vacancy = Vacancy.new(params[:vacancy])
    if @vacancy.save
      flash[:notice] = I18n.t("vacancies.flash.notices.created")
      redirect_to :action => "edit", :id => @vacancy.id
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @vacancy = Vacancy.find(params[:id])
  end



  def update
    @vacancy = Vacancy.find(params[:id])
    if @vacancy.update_attributes(params[:vacancy])
      flash[:notice] = I18n.t("vacancies.flash.notices.updated")
      redirect_to :action => "edit", :id => @vacancy.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Vacancy.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.vacancy.notices.deleted")
    redirect_to :action => "index"
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @regions = Region.find(:all, :order => "name")
  end

end
