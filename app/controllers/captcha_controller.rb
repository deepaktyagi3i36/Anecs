class CaptchaController < ApplicationController
  # ::Rails.logger.error("...")

  download_rmagick_catcha :show
end
