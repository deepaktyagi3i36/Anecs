class CreateThemesInsideTable < ActiveRecord::Migration
  def self.up
    wellness = Website.find_by_code("wellness")
    if wellness
      Theme.create!(:website_id => wellness.id, :name => "wellness", :code => "wellness",
                    :about => "wellness", :primary => 1, :enabled => 1)
    end

    hunting = Website.find_by_code("hunting")
    if hunting
      Theme.create!(:website_id => hunting.id, :name => "hunting", :code => "hunting",
                    :about => "hunting", :primary => 1, :enabled => 1)
    end

  end

  def self.down
    wellness = Theme.find_by_code("wellness")
    Theme.destroy(wellness.id) unless wellness.nil?

    hunting = Theme.find_by_code("hunting")
    Theme.destroy(hunting.id) unless hunting.nil?
  end
end
