class VacanciesController < ApplicationController
  #::Rails.logger.error("...")
  layout "greetings"

  def index
    # Find all vacancies
    @vacancies = @region.vacancies.all :conditions => VacancyFilter.enabled_vacancies
  end

  def show
    @vacancy = Vacancy.find(params[:id].to_i)
  end

end


