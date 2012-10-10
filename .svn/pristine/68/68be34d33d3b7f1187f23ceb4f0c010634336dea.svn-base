module LiquidHelper

  def translate_message(text)
    I18n.t(text)
  end

  #function use to category url
  def category_link(code)
    @category = Category.find_by_code(code)
    return @category.url
  end

  #function use to link the category
  def link_to_category(link,text)
    link_to text,link
  end

  #function use for language link
  def link_to_language(name,id)
    link_to UnicodeUtils.titlecase(name) , "/languages/update/?id=#{id}"
  end

  #function use for footer link
  def link_to_footer(text,controller,action)
    link_to text, "#{controller}/#{action}"
  end

  #function use for top line page link
  def manpage_url_by_code(text,code)
    link_to  text, Manpage.url_by_code(code)
  end

  #function use for top line page link
  def manpage_root_url(text)
    link_to text, Manpage.root_url
  end

  #function use for current theme image url
  def theme_image_url(image_name)
    return "/assets/wellness/images/"+image_name
  end


end


