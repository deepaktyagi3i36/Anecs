class AddWebsiteConfigurations < ActiveRecord::Migration
  def self.up
    english = Language.find_by_code("english")
    russian = Language.find_by_code("russian")
    dollar = Currency.find_by_code("dollar")
    rouble = Currency.find_by_code("rouble")

    # Iterate by websites
    Website.find(:all).each do |website|
      if website.code == "anecs"
        var1 = WebsiteLanguage.find_by_website_id_and_language_id(website.id, english.id)
        if var1.nil?
          WebsiteLanguage.create!(:website_id => website.id, :language_id => english.id, :primary => 1)
        end
        var2 = WebsiteCurrency.find_by_website_id_and_currency_id(website.id, dollar.id)
        if var2.nil?
          WebsiteCurrency.create!(:website_id => website.id, :currency_id => dollar.id, :primary => 1)
        end
      else
        var1 = WebsiteLanguage.find_by_website_id_and_language_id(website.id, russian.id)
        if var1.nil?
          WebsiteLanguage.create!(:website_id => website.id, :language_id => russian.id, :primary => 1)
        end
        var2 = WebsiteCurrency.find_by_website_id_and_currency_id(website.id, rouble.id)
        if var2.nil?
          WebsiteCurrency.create!(:website_id => website.id, :currency_id => rouble.id, :primary => 1)
        end
      end
    end
  end

  def self.down
    raise "not implemented"
  end
end
