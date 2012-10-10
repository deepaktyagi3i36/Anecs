# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # ::Rails.logger.error("...")
  # include LiquidHelper

  # Method to check the flash existance
  
  def has_flash_any_key?
    return true if flash.key?(:notice)
    return true if flash.key?(:information)
    return true if flash.key?(:warning)
    return true if flash.key?(:error)
    return false
  end

  # Method to check the flash existance
  def has_form_flash_any_key?
    return true if flash.key?(:form_notice)
    return true if flash.key?(:form_information)
    return true if flash.key?(:form_warning)
    return true if flash.key?(:form_error)
    return false
  end

  # Makes main menu item. Accept the following values:
  # label - menu item label
  # url - menu item url
  # match_path - pattern for active item
  def main_menu_item(args)
    link = link_to(args[:label], args[:url])
    if (args.has_key?(:active) ? args[:active] : Regexp.new(args[:match_path]).match(request.fullpath.to_s) )
      content_tag("li",
          content_tag("span", link))
    else
      content_tag("li", link)
    end
  end

  # Makes tabular menu item. Accept the following values:
  # label - menu item label
  # url - menu item url
  # match_path - pattern for active item
  def tabular_menu_item(args)
    link = link_to(args[:label], args[:url])
    if (args.has_key?(:active) ? args[:active] : Regexp.new(args[:match_path]).match(request.fullpath.to_s) )
      content_tag("li",
        content_tag("span", link))
    else
      content_tag("li", link)
    end
  end

  # Makes list menu item. Accept the following values:
  # label - menu item label
  # url - menu item url
  # match_path - pattern for active item
  def list_menu_item(args)
    link = link_to(args[:label], args[:url])
    if (args.has_key?(:active) ? args[:active] : Regexp.new(args[:match_path]).match(request.fullpath.to_s) )
      content_tag("li",
          content_tag("span", link))
    else
      content_tag("li", link)
    end
  end

  #
  def slide_menu_item(args)
    link = link_to(args[:label], args[:url])
    if (args.has_key?(:active) ? args[:active] : Regexp.new(args[:match_path]).match(request.fullpath.to_s) )
      content_tag("li",
          content_tag("span", link))
    else
      content_tag("li", link)
    end
  end

  #
  def tree_menu_item(args)
    raise "Not impemented"
  end
end
