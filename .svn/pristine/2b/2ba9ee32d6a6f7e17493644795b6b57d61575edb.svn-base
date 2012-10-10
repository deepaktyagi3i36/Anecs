# = Entity description
#
# Article is an article that registred at system. There is a library, that collect
# all articles at the system. Article can be connected with a infoitem, such connection
# are located at bookcases table.
#
# == Link
# http://localhost:3000/library/ Here is library.
#
# == Table information
# Quantity of record will grow during lifetime, I expect about 100-1000 records.
#
#
class RequestSweeper < ActionController::Caching::Sweeper
  # ::Rails.logger.error("...")
  observe Article

  def after_save(record)
    expire_action(:controller => "/library")
    expire_action(:controller => "/library", :action => "index")
    expire_action(:controller => "/library", :action => "show")
    expire_action(:controller => "/library", :action => "show", :code => "sport_supplement_aminoacids")
    expire_action(:controller => "/library", :action => "show", :code => "sport_supplement_vitamins")

    # expire_page(:controller => 'causes', :action => 'show', :id => record.id)
    # cause.nonprofits.each do |nonprofit|
    #  expire_page(:controller => 'nonprofits', :action => 'show', :id => nonprofit.id)
    # end
  end

  def after_update(record)
  end

  def after_destroy(record)
  end
end
