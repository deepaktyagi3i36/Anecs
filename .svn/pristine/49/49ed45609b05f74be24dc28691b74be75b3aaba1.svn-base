class ComparatorsController < ApplicationController
  # ::Rails.logger.error("...")
  layout "greetings"

  def edit
    # :id is not mandatory, but if id is present
    # then is should be equil id of the current comparator
    if (!params[:id].nil? && params[:id].to_i != @comparator.id)
      raise ActiveRecord::RecordNotFound
    end

    @comparator_items = @comparator.comparator_items
  end

  def update
    @comparator_items = @comparator.comparator_items
    success = true
    if params.include? 'delete_comparator_items'
       success = @comparator.delete_all_comparator_items
    else
      success = @comparator.update_attributes(params[:comparator])
    end
    if success
      flash[:notice] = I18n.t('activeview.flashes.comparator.notices.updated')
      redirect_to :action => :edit
    else
      flash[:error] = I18n.t('activeview.flashes.comparator.errors.not_updated')
      render :edit
    end
  end

  def add_to_comparator
    item = nil
    if params.has_key?(:variant_id)
      item = ComparatorItem.new({:variant_id =>params[:variant_id]})
    elsif params.has_key?(:comparator_item)
      item = ComparatorItem.new(params[:comparator_item])
    end

    # Check that variant_id is selected
    if item.nil? or item.variant_id.nil?
      redirect_to :back
      return
    end

    # Add a new variant to comparator
    @comparator.add_comparator_item(item)
    if(@comparator.comparator_items.size() < 2)
      redirect_to :back
    else
      redirect_to :action => "edit", :id => @comparator.id
    end
  end
end
