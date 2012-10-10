# = Entity description
#
# ClearOrdersJob is an entity which deletes orders stored at orders table.
# Job deletes orders in state before "in progress" with checkout_state before "completed" and
# which had updated later than N hours ago (2 hours by default). N is defined in runtime_settings table by
# order_expire_timeout parameter.
#

class ExportDictionariesJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("export_dictionaries_job")
      if job
        if(attributes.nil?)
          attributes = {:admin_job_id => job.id}
        end
        if(attributes[:admin_job_id].nil?)
          attributes.merge!({:admin_job_id => job.id})
        end
      end
    end
    super(attributes)
  end


  def perform

    begin
      report_started

      setup_begin_at

      setup_runbatch

      load_runtime_settings

      export_dictinaries

      create_finished

      report_finished

      setup_success

    rescue Exception => e

      report_failure(e)

      setup_failure(e)
    end

    email_finished
  end

  private
  def export_dictinaries
    # Try to build xml document
    builder = ::Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.Dictionaries('xmlns:xsi' => "http://www.w3.org/2001/XMLSchema-instance",
                       'xsi:noNamespaceSchemaLocation' => "dictionaries.xsd") {
        build_address_types(xml)
        build_admin_jobs(xml)
        build_announcement_status(xml)
        build_article_types(xml)
        build_category_types(xml)
        build_change_freqs(xml)
        build_checkout_states(xml)
        build_comment_statuses(xml)
        build_comment_types(xml)
        build_complaint_statuses(xml)
        build_complaint_types(xml)
        build_contact_statuses(xml)
        build_contract_types(xml)
        build_countries(xml)
        build_currencies(xml)
        build_datatypes(xml)
        build_languages(xml)
        build_opinion_statuses(xml)
        build_order_states(xml)
        build_pattern_types(xml)
        build_payment_types(xml)
        build_privacy_types(xml)
        build_promotion_types(xml)
        build_request_statuses(xml)
        build_roles(xml)
        build_runtime_settings(xml)
        build_shipping_types(xml)
        build_states(xml)
        build_timetable_statuses(xml)
        build_user_statuses(xml)
      }
    end


    FileUtils.mkdir_p("#{::Rails.root.to_s}/tmp/databases/")
    file = "#{::Rails.root.to_s}/tmp/databases/dictionaries.xml.gz"
    Zlib::GzipWriter.open(file) do |gz|
      gz.write builder.to_xml
    end

    # Move file from tmp to public (with no error)
    FileUtils.mkdir_p("#{::Rails.root.to_s}/public/system/")
    src = "#{::Rails.root.to_s}/tmp/databases/dictionaries.xml.gz"
    dest = "#{::Rails.root.to_s}/public/system/dictionaries.xml.gz"
    FileUtils.mv src, dest, :force => true
  end

  def build_address_types(xml)
    xml.AddressTypes {
      AddressType.find(:all).each do |address_type|
        xml.AddressType(:name => address_type.name, :code => address_type.code, :about => address_type.about)
      end
      report_iteration("AddressTypes is exported successfully.")
      create_iteration("AddressTypes is exported successfully.")
    }
  end

  def build_admin_jobs(xml)
    xml.AdminJobs {
      AdminJob.find(:all).each do |admin_job|
        xml.AdminJob(:name => admin_job.name, :code => admin_job.code, :about => admin_job.about, :job => admin_job.job){
          if @runtime_settings["include_admin_job_reports_into_export"] == "1"
            xml.AdminJobReports{
              admin_job.admin_job_reports.each do |admin_job_report|
                xml.AdminJobReport(:runbatch => admin_job_report.runbatch, :message =>  admin_job_report.message)
              end
            }
          end
        }
      end
      report_iteration("AdminJobs is exported successfully.")
      create_iteration("AdminJobs is exported successfully.")
    }
  end

  def build_announcement_status(xml)
    xml.AnnouncementStatuses {
      AnnouncementStatus.find(:all).each do |announcement_status|
        xml.AnnouncementStatus(:name => announcement_status.name, :code => announcement_status.code,
                               :about => announcement_status.about)
      end
      report_iteration("AnnouncementStatuses is exported successfully.")
      create_iteration("AnnouncementStatuses is exported successfully.")
    }
  end

  def build_article_types(xml)
    xml.ArticleTypes {
      ArticleType.find(:all).each do |article_type|
        xml.ArticleType(:name => article_type.name, :code => article_type.code, :about => article_type.about)
      end
      report_iteration("ArticleTypes is exported successfully.")
      create_iteration("ArticleTypes is exported successfully.")
    }
  end

  def build_category_types(xml)
    xml.CategoryTypes {
      CategoryType.find(:all).each do |category_type|
        xml.CategoryType(:name => category_type.name, :code => category_type.code, :about => category_type.about)
      end
      report_iteration("CategoryTypes is exported successfully.")
      create_iteration("CategoryTypes is exported successfully.")
    }
  end

  def build_change_freqs(xml)
    xml.ChangeFreqs {
      ChangeFreq.find(:all).each do |change_freq|
        xml.ChangeFreq(:name => change_freq.name, :code => change_freq.code, :about => change_freq.about)
      end
      report_iteration("CheckoutStates is exported successfully.")
      create_iteration("CheckoutStates is exported successfully.")
    }
  end

  def build_checkout_states(xml)
    xml.CheckoutStates {
      CheckoutState.find(:all).each do |checkout_state|
        xml.CheckoutState(:name => checkout_state.name, :code => checkout_state.code,
                          :about => checkout_state.about)
      end
      report_iteration("CheckoutStates is exported successfully.")
      create_iteration("CheckoutStates is exported successfully.")
    }
  end

  def build_comment_statuses(xml)
    xml.CommentStatuses {
      CommentStatus.find(:all).each do |comment_status|
        xml.CommentStatus(:name => comment_status.name, :code => comment_status.code, :about => comment_status.about)
      end
      report_iteration("CommentStatuses is exported successfully.")
      create_iteration("CommentStatuses is exported successfully.")
    }
  end

  def build_comment_types(xml)
    xml.CommentTypes {
      CommentType.find(:all).each do |comment_type|
        xml.CommentType(:name => comment_type.name, :code => comment_type.code, :about => comment_type.about)
      end
      report_iteration("ComentTypes is exported successfully.")
      create_iteration("ComentTypes is exported successfully.")
    }
  end

  def build_complaint_statuses(xml)
    xml.ComplaintStatuses {
      ComplaintStatus.find(:all).each do |complaint_status|
        xml.ComplaintStatus(:name => complaint_status.name, :code => complaint_status.code, :about => complaint_status.about)
      end
      report_iteration("ComplaintStatuses is exported successfully.")
      create_iteration("ComplaintStatuses is exported successfully.")
    }
  end

  def build_complaint_types(xml)
    xml.ComplaintTypes {
      ComplaintType.find(:all).each do |complaint_type|
        xml.ComplaintType(:name => complaint_type.name, :code => complaint_type.code, :about => complaint_type.about)
      end
      report_iteration("ComplaintTypes is exported successfully.")
      create_iteration("ComplaintTypes is exported successfully.")
    }
  end

  def build_contact_statuses(xml)
    xml.ContactStatuses {
      ContactStatus.find(:all).each do |contact_status|
        xml.ContactStatus(:name => contact_status.name, :code => contact_status.code, :about => contact_status.about)
      end
      report_iteration("ContactStatuses is exported successfully.")
      create_iteration("ContactStatuses is exported successfully.")
    }
  end

  def build_contract_types(xml)
    xml.ContractTypes {
      ContractType.find(:all).each do |contact_type|
        xml.ContractType(:name => contact_type.name, :code => contact_type.code, :about => contact_type.about)
      end
      report_iteration("ContractTypes is exported successfully.")
      create_iteration("ContractTypes is exported successfully.")
    }
  end

  def build_countries(xml)
    xml.Countries {
      Country.find(:all).each do |country|
        xml.Country(:name => country.name, :code => country.code, :about => country.about)
      end
      report_iteration("Countries is exported successfully.")
      create_iteration("Countries is exported successfully.")
    }
  end

  def build_currencies(xml)
    xml.Currencies {
      Currency.find(:all).each do |currency|
        xml.Currency(:name => currency.name, :code => currency.code, :about => currency.about,
                     :sign => currency.sign)
      end
      report_iteration("Currencies is exported successfully.")
      create_iteration("Currencies is exported successfully.")
    }
  end

  def build_datatypes(xml)
    xml.Datatypes {
      Datatype.find(:all).each do |datatype|
        xml.Datatype(:name => datatype.name, :code => datatype.code, :about => datatype.about)
      end
      report_iteration("Datatypes is exported successfully.")
      create_iteration("Datatypes is exported successfully.")
    }
  end

  def build_languages(xml)
    xml.Languages {
      Language.find(:all).each do |language|
        xml.Language(:name => language.name, :code => language.code, :about => language.about,
          :locale => language.locale, :enabled => language.enabled)
      end
      report_iteration("Languages is exported successfully.")
      create_iteration("Languages is exported successfully.")
    }
  end

  def build_opinion_statuses(xml)
    xml.OpinionStatuses {
      OpinionStatus.find(:all).each do |opinion_status|
        xml.OpinionStatus(:name => opinion_status.name, :code => opinion_status.code, :about => opinion_status.about)
      end
      report_iteration("OpinionStatuses is exported successfully.")
      create_iteration("OpinionStatuses is exported successfully.")
    }
  end

  def build_order_states(xml)
    xml.OrderStates {
      OrderState.find(:all).each do |order_state|
        xml.OrderState(:name => order_state.name, :code => order_state.code, :about => order_state.about)
      end
      report_iteration("OrderStates is exported successfully.")
      create_iteration("OrderStates is exported successfully.")
    }
  end

  def build_pattern_types(xml)
    xml.PatternTypes {
      PatternType.find(:all).each do |pattern_type|
        xml.PatternType(:name => pattern_type.name, :code => pattern_type.code, :about => pattern_type.about)
      end
      report_iteration("PatternTypes is exported successfully.")
      create_iteration("PatternTypes is exported successfully.")
    }
  end

  def build_payment_types(xml)
    xml.PaymentTypes {
      PaymentType.find(:all).each do |address_type|
        xml.PaymentType(:name => address_type.name, :code => address_type.code, :about => address_type.about)
      end
      report_iteration("PaymentTypes is exported successfully.")
      create_iteration("PaymentTypes is exported successfully.")
    }
  end

  def build_privacy_types(xml)
    xml.PrivacyTypes {
      PrivacyType.find(:all).each do |address_type|
        xml.PrivacyType(:name => address_type.name, :code => address_type.code, :about => address_type.about)
      end
      report_iteration("PrivacyTypes is exported successfully.")
      create_iteration("PrivacyTypes is exported successfully.")
    }
  end

  def build_promotion_types(xml)
    xml.PromotionTypes {
      PromotionType.find(:all).each do |promotion_type|
        xml.PromotionsType(:name => promotion_type.name, :code => promotion_type.code, :about => promotion_type.about)
      end
      report_iteration("PromotionsTypes is exported successfully.")
      create_iteration("PromotionsTypes is exported successfully.")
    }
  end

  def build_request_statuses(xml)
    xml.RequestStatuses {
      RequestStatus.find(:all).each do |request_status|
        xml.RequestStatus(:name => request_status.name, :code => request_status.code, :about => request_status.about)
      end
      report_iteration("RequestStatuses is exported successfully.")
      create_iteration("RequestStatuses is exported successfully.")
    }
  end

  def build_roles(xml)
    xml.Roles {
      Role.find(:all).each do |role|
        xml.Role(:name => role.name, :code => role.code, :about => role.about)
      end
      report_iteration("Roles is exported successfully.")
      create_iteration("Roles is exported successfully.")
    }
  end

  def build_runtime_settings(xml)
    xml.RuntimeSettings {
      RuntimeSetting.find(:all).each do |runtime_setting|
        xml.RuntimeSetting(:name => runtime_setting.name, :code => runtime_setting.code,
                           :about => runtime_setting.about, :value => runtime_setting.value)
      end
      report_iteration("RuntimeSettings")
      create_iteration("RuntimeSettings")
    }
  end

  def build_shipping_types(xml)
    xml.ShippingTypes {
      ShippingType.find(:all).each do |shipping_type|
        xml.ShippingType(:name => shipping_type.name, :code => shipping_type.code, :about => shipping_type.about)
      end
      report_iteration("ShippingTypes")
      create_iteration("ShippingTypes")
    }
  end

  def build_states(xml)
    xml.States {
      State.find(:all).each do |state|
        xml.State(:name => state.name, :code => state.code, :about => state.about)
      end
      report_iteration("States")
      create_iteration("States")
    }
  end

  def build_timetable_statuses(xml)
    xml.TimetableStatuses {
      TimetableStatus.find(:all).each do |timetable_status|
        xml.TimetableStatus(:name => timetable_status.name, :code => timetable_status.code, :about => timetable_status.about)
      end
      report_iteration("TimetableStatuses")
      create_iteration("TimetableStatuses")
    }
  end

  def build_user_statuses(xml)
    xml.UserStatuses {
      UserStatus.find(:all).each do |user_status|
        xml.UserStatus(:name => user_status.name, :code => user_status.code, :about => user_status.about)
      end
      report_iteration("UserStatuses")
      create_iteration("UserStatuses")
    }
  end

  def report_iteration(dictionary)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "The dictionary: #{dictionary} is exported successfully.")
  end

  def create_iteration(dictionary)
    message = "The dictionary: #{dictionary} is exported successfully."
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch, :message => message})
  end
end