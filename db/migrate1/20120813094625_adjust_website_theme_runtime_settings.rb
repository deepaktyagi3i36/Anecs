class AdjustWebsiteThemeRuntimeSettings < ActiveRecord::Migration
  def self.up
    default_theme = RuntimeSetting.find_by_name('default_theme')
    RuntimeSetting.destroy(default_theme.id) unless default_theme.nil?

    default_website_id = RuntimeSetting.find_by_name('default_website_id')
    RuntimeSetting.destroy(default_website_id.id) unless default_website_id.nil?

  end

  def self.down
    default_theme = RuntimeSetting.find_by_name('default_theme')
    if default_theme.nil?
      RuntimeSetting.create! :name => "default_theme", :code => "default_theme", :about => "default_theme", :value => 'anecs'
    end

    default_website_id = RuntimeSetting.find_by_name('default_website_id')
    if default_website_id.nil?
      RuntimeSetting.create! :name => "default_website_id", :code => "default_website_id", :about => "default_website_id", :value => 'anecs'
    end

  end
end
