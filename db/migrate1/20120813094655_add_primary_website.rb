class AddPrimaryWebsite< ActiveRecord::Migration
  def self.up
    # Create anecs as primary
    anecs = Website.find_by_code("anecs")
    if anecs.nil?
      anecs = Website.create!(:name => "anecs", :code => "anecs", :about => "anecs",
                              :domain => "www.example.com", :primary => 1, :enabled => 1)
    end
  end

  def self.down
    anecs = Website.find_by_code("anecs")
    Website.destroy(anecs.id) unless anecs.nil?
  end
end
