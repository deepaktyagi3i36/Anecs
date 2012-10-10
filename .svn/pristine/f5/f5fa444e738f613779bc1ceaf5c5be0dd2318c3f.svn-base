class Myaccount::Welcome::MyprofileController < MyaccountController
  # ::Rails.logger.error("...")

  def index
  end

  def edit
    @user = current_user
    #@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:form_notice] = I18n.t("activeview.flashes.user.notices.updated")
      redirect_to :action => "edit", :id => @user.id
    else
      render :action => "edit"
    end
  end


end
