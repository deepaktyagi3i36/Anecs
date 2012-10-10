ThemesForRails.config do |config|
  config.themes_dir = ":root/app/assets/themes"
  config.assets_dir = ":root/app/assets/themes/:name" 
  config.views_dir = ":root/app/views/themes/:name"
  config.themes_routes_dir = "assets"
end
