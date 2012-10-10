class AdjustWebsiteAtRuntimeSettingsDefaultTheme < ActiveRecord::Migration
  def self.up
    default_theme = RuntimeSetting.find_by_name('default_theme')
    if default_theme.nil?
      RuntimeSetting.create! :name => "default_theme", :code => "default_theme", :about => "default_theme", :value => 'anecs'
    end
  end

  def self.down
    default_theme = RuntimeSetting.find_by_name('default_theme')
    RuntimeSetting.destroy(default_theme.id) unless default_theme.nil?
  end
end
