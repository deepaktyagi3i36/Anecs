class Postoffice < ActionMailer::Base
  # ::Rails.logger.error("...")

  def signup_notification(user, runtime_settings)
    @user = user
    @runtime_settings = runtime_settings
    @url = "http://#{runtime_settings["server_url"]}/activate/#{user.perishable_token}"

    mail(:to => user.email,
         :from => runtime_settings["email_noreply_address"],
         :subject => "#{runtime_settings["server_name"]} - #{I18n.t('activeview.messages.user.registration.activation')}",
         :content_type => 'text/html')
  end

  def activation(user, runtime_settings)
    @user = user
    @runtime_settings = runtime_settings
    @url = runtime_settings["server_url"]

    mail(:to => user.email,
         :from => runtime_settings["email_noreply_address"],
         :subject => "#{runtime_settings["server_name"]} - #{I18n.t('activeview.messages.user.registration.completed')}",
         :content_type => 'text/html')
  end

  def reset_notification(user, runtime_settings)
    @user = user
    @runtime_settings = runtime_settings
    @url = "http://#{runtime_settings["server_url"]}/reset/#{user.perishable_token}"

    mail(:to => user.email,
         :from => runtime_settings["email_noreply_address"],
         :subject => "#{runtime_settings["server_name"]} - #{I18n.t('activeview.messages.user.reset')}",
         :content_type => 'text/html')
  end


  def order_confirmed_user_notification(order)
    setup_order_email(order, runtime_settings)
    @recipients = order.email
    @subject = I18n.t('orders.notification.user.subject.confirmation', :order_no => order.name, :site_name => DomainsConfiguration.lookup('server.name'))
  end

  def order_confirmed_sales_notification(order)
    setup_order_email(order, runtime_settings)
    @recipients = DomainsConfiguration.lookup('addresses.order_notification.recipients')
    @subject = I18n.t('orders.notification.sales.subject.confirmation', :order_no => order.name, :site_name => DomainsConfiguration.lookup('server.name'))
  end

  def order_cancelled_user_notification(order)
    setup_order_email(order, runtime_settings)
    @recipients = order.email
    @subject = I18n.t('orders.notification.user.subject.cancellation', :order_no => order.name, :site_name => DomainsConfiguration.lookup('server.name'))
  end

  def out_of_stocks_notification(inventory)
    setup_stockman_email(inventory, runtime_settings)
    @recipients = DomainsConfiguration.lookup('addresses.stockman_notification.recipients')
    variant_name = inventory.variant.product.t_name + ', ' + inventory.variant.t_name
    @body[:variant_name] = variant_name
    @subject = I18n.t('orders.notification.stockman.subject.out_of_stocks', :variant => variant_name, :site_name => DomainsConfiguration.lookup('server.name'))
  end

  def order_cancelled_sales_notification(order)
    setup_order_email(order, runtime_settings)
    @recipients = DomainsConfiguration.lookup('addresses.order_notification.recipients')
    @subject = I18n.t('orders.notification.sales.subject.cancellation', :order_no => order.name, :site_name => DomainsConfiguration.lookup('server.name'))
  end

  def contact_notification(contact, runtime_settings)
    setup_contact_email(contact, runtime_settings)
    @recipients = DomainsConfiguration.lookup('addresses.contact_notification.recipients')
    @subject = I18n.t('contact.notification.subject', :type => contact.class.human_name,
      :reason => contact.contact_type.t_name, :site_name => DomainsConfiguration.lookup('server.name'))
  end

  def admin_job_notification(admin_job, runtime_settings)
    @admin_job = admin_job
    @runtime_settings = runtime_settings

    success = I18n.t('activeview.messages.admin_job.success')
    failure = I18n.t('activeview.messages.admin_job.failure')
    mail(:to => runtime_settings["email_webmaster_address"],
         :from => runtime_settings["email_noreply_address"],
         :subject => "#{runtime_settings["server_name"]} - #{(admin_job.success == 1 ? success : failure)}",
         :content_type => 'text/html')
  end

  protected
  def setup_order_email(order, runtime_settings)
    @from = runtime_settings["email_noreply_address"]
    @sent_on = Time.now
    @content_type = 'text/html'
    @body[:order] = order
    @body[:runtime_settings] = runtime_settings
    @body[:currency] = Currency.find(order.order_variants.first.currency_id)
  end

  def setup_stockman_email(inventory, runtime_settings)
    @from = runtime_settings["email_noreply_address"]
    @sent_on = Time.now
    @content_type = 'text/html'
    @body[:inventory] = inventory
    @body[:runtime_settings] = runtime_settings
  end

  def setup_contact_email(contact, runtime_settings)
    @from = DomainsConfiguration.lookup('addresses.order_notification.from')
    @sent_on = Time.now
    @content_type = 'text/html'
    @body[:contact] = contact
    @body[:runtime_settings] = runtime_settings
  end

end
