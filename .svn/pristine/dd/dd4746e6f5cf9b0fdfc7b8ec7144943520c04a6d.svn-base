module ProductsMethods
  #::Rails.logger.error("...")

  def check_category
    category = params["category"]
    if category.nil? || category.to_i.nil?
      redirect_to root_url
    end
  end

  def check_product
    product = params["product"]
    if product.nil? || product.to_i.nil?
      redirect_to root_url
    end
  end

  protected
  def set_breadcrumb_for product
    breadcrumbs = []
    parent = product

    # Push all parents and itself
    while parent
      breadcrumbs << [parent.name, parent.to_param]
      parent = parent.parent
    end

    # Push breadcrumb back order
    breadcrumbs.reverse.each do |item|
      add_breadcrumb item[0], item[1]
    end
  end

end
