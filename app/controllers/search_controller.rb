class SearchController < ApplicationController
  # ::Rails.logger.error("...")
  layout "greetings"

  def results

    @type = params[:type]
    @orderby_options = get_orderby_options
    @itemsonpage_options = get_itemsonpage_options
    @orderby = params['orderby'] || 'solr_score desc'
    @itemsonpage = params['itemsonpage'] || '10'
    @products_total = 0
    @articles_total = 0
    @total = 0
    results = Array.new

    if params[:q]

      @q = params[:q]
      query = Query.new(:q => @q)
      if !query.valid?
        flash[:search_error] = query.errors.on(:q)
        redirect_back_or_default(root_path) and return
      end
      # Get options from request or default
      begin
        products = find_by_model(Product, @q)
        @products_total = products.total
        articles = find_by_model(Article, @q)
        @articles_total = articles.total

        #centers = find_by_model(Center, @q)
        #@centers_total = centers.total
        #experts = find_by_model(Expert, @q)
        #@experts_total = experts.total
      rescue
        flash[:search_error] = I18n.t('search.message.query_invalid')
        redirect_back_or_default(root_path) and return
      end

      @total = @products_total + @articles_total #+ @centers_total + @experts_total


      if !products.nil? && @products_total > 0 && (@type.nil? ||@type == 'products')
        results += products.results
      end
      if !articles.nil? && @articles_total > 0 && (@type.nil? || @type == 'articles')
        results += articles.results
      end
      #if !centers.nil? && @centers_total > 0 && (params[:type].nil? || params[:type] == 'centers')
      #  results += centers.results
      #end
      #if !experts.nil? && @experts_total > 0 && (params[:type].nil? || params[:type] == 'experts')
      #  results += experts.results
      #end


      order_parts = @orderby.split(/\s+/)
      reversed = (!order_parts[1].nil? && order_parts[1].downcase == 'desc')
      results.sort! do |x, y|
        if reversed
          y.send(order_parts[0]) <=> x.send(order_parts[0])
        else
          x.send(order_parts[0]) <=> y.send(order_parts[0])
        end
      end
    end
    @searches = results.paginate :page => params[:page], :per_page => @itemsonpage, :order => @orderby
  end

# Return predefined order by options
  def get_orderby_options
    orderby_options =
        [[I18n.t('search.orderby_options.by_relevance'), 'solr_score desc'],
            [I18n.t('sorting.options.by_name'), Product.localname(:name)]]
    if @type == 'products'
      orderby_options +=
          [
              #[I18n.t('sorting.options.by_experts_rating'), 'expert_rating desc'],
          [I18n.t('search.orderby_options.by_price_asc'), 'min_price'],
              [I18n.t('search.orderby_options.by_price_desc'), 'min_price desc'],
          #[I18n.t('sorting.options.by_users_rating'), 'user_rating desc']
          ]
    end
    orderby_options
  end

  private
  def find_by_model(model, q)
    objects = model.send :find_by_solr, q, :limit => 1024, :scores => true
    # If search doesn't return any results, try a wildcard search
    if objects.total == 0 && !q.end_with?('*')
      objects = model.send :find_by_solr, q + '*', :limit => 1024, :scores => true
    end
    objects
  end

end


