module ProductsHelper
  # ::Rails.logger.error("...")

  #
  #
  def parents_and_self(category)
    result = []
    parents = []
    parent = category

    # Push all parents and itself
    while parent
      parents << parent
      parent = parent.parent
    end

    # Push back order
    parents.reverse.each do |item|
      result << item
    end
    result
  end

  #
  #
  def parents_self_and_childs(category)
    result = []
    parents = []

    # Push all parents and itself
    parent = category
    while parent
      parents << parent
      parent = parent.parent
    end

    # Push back order
    parents.reverse.each do |item|
      result << item
    end

    # Push all first childs
    child = category
    while child and child.has_children?
      child = child.children[0]
      result << child
    end
    result
  end

  #
  #
  def self_and_childs(category)
    result = [category]

    # Push all first childs
    child = category
    while child and child.has_children?
      child = child.children[0]
      result << child
    end
    result
  end

  #
  #
  def show_product_layout(category)
    # Get category root node
    case category.root.code.downcase
      when "books_department"
        return "products1"
      when "clothes_department"
        return "products2"
      when "electronics_department"
        return "products1"
      else
        return "products"
    end
  end

  #
  #
  def index_product_layout(category)
    # Get category root node
    case category.root.code.downcase
      when "books_department"
        return "products1"
      when "clothes_department"
        return "products2"
      when "electronics_department"
        return "products2"
      else
        return "products"
    end
  end
end
