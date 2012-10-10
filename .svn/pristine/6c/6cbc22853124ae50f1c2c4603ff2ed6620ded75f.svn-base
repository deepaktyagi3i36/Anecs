class Myaccount::Welcome::PasswordController < MyaccountController
  # ::Rails.logger.error("...")

  def edit
    @change_password = ChangePassword.new
  end

  def update
    change_password = (params.nil? || params[:change_password].nil?) ? Hash.new() : params[:change_password]
    @change_password = ChangePassword.new(change_password.merge({:login => current_user.login}))
    if @change_password.valid?
      if current_user && current_user.update_attributes(:password => @change_password.password,
        :password_confirmation => @change_password.password_confirmation)
        flash[:form_notice] = I18n.t("activeview.flashes.user.notices.password_changed")
        redirect_to :action => "edit"
      else
        # Here is error to update
        @change_password.errors.add_to_base(I18n.t('activerecord.errors.models.change_password.inv_update'))
        render :action => :edit
      end
    else
      render :action => "edit"
    end
  end


end
