# = Entity description
#
# TruncateDatabaseJob is an entity that delets all old sessions. The old session is a session
# updated more or equal N days before. Time of update difined by timestamp property of sessions
# table. Number of days N defined in runtime_settings table by value of session_expire_timeout field.
#
# == Link
#
class TruncateDatabaseJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("truncate_databse_job")
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

      truncate_database

      create_finished

      report_finished

      setup_success

      truncate_admin_jobs

    rescue Exception => e
      report_failure(e)

      setup_failure(e)
    end

    email_finished
  end

  private
  def truncate_database
    # Truncate next table
    Address.delete_all
    report_iteration("Addresses")
    create_iteration("Addresses")

    # Truncate next table
    AddressType.delete_all
    report_iteration("AddressTypes")
    create_iteration("AddressTypes")

    # Truncate next table
    AdminJobReport.delete_all
    report_iteration("AdminJobReports")
    create_iteration("AdminJobReports")

    # Truncate next table
    AdminJob.delete_all(["id != ?", @admin_job_id])
    report_iteration("AdminJobs")
    create_iteration("AdminJobs")

    # Truncate next table
    Agent.delete_all
    report_iteration("Agents")
    create_iteration("Agents")

    # Truncate next table
    AlbumPhoto.delete_all
    report_iteration("AlbumPhotos")
    create_iteration("AlbumPhotos")

    # Truncate next table
    Album.delete_all
    report_iteration("Albums")
    create_iteration("Albums")

    # Truncate next table
    AlertMember.delete_all
    report_iteration("AlertMembers")
    create_iteration("AlertMembers")

    # Truncate next table
    AlertType.delete_all
    report_iteration("AlertTypes")
    create_iteration("AlertTypes")

    # Truncate next table
    AlertValue.delete_all
    report_iteration("AlertValues")
    create_iteration("AlertValues")

    # Truncate next table
    Alert.delete_all
    report_iteration("Alerts")
    create_iteration("Alerts")

    # Truncate next table
    Announcement.delete_all
    report_iteration("Announcements")
    create_iteration("Announcements")

    # Truncate next table
    AnnouncementStatus.delete_all
    report_iteration("AnnouncementStatuses")
    create_iteration("AnnouncementStatuses")

    # Truncate next table
    Answer.delete_all
    report_iteration("Answers")
    create_iteration("Answers")

    # Truncate next table
    # Article.delete_all, process tree structure
    sqlwhere = "
    not exists (
      select
        1
      from
        articles i
      where
            i.parent_id = articles.id
    )";
    while true
      counter = 0
      Article.find(:all, :conditions => [sqlwhere]).each do |item|
        item.delete
        counter += 1
      end
      break if counter == 0
    end
    report_iteration("Articles")
    create_iteration("Articles")

    # Truncate next table
    ArticleType.delete_all
    report_iteration("ArticleTypes")
    create_iteration("ArticleTypes")

    # Truncate next table
    Audio.delete_all
    report_iteration("Audios")
    create_iteration("Audios")

    # Truncate next table
    Bookcase.delete_all
    report_iteration("Bookcases")
    create_iteration("Bookcases")

    # Truncate next table
    BuyOffer.delete_all
    report_iteration("BuyOffers")
    create_iteration("BuyOffers")

    # Truncate next table
    Callmeback.delete_all
    report_iteration("Callmebacks")
    create_iteration("Callmebacks")

    # Truncate next table
    CartItem.delete_all
    report_iteration("CartItems")
    create_iteration("CartItems")

    # Truncate next table
    CategoryType.delete_all
    report_iteration("CategoryTypes")
    create_iteration("CategoryTypes")


    # Truncate next table
    CheckoutState.delete_all
    report_iteration("CheckoutStates")
    create_iteration("CheckoutStates")

    # Truncate next table
    CommentStatus.delete_all
    report_iteration("CommentStatuses")
    create_iteration("CommentStatuses")

    # Truncate next table
    CommentType.delete_all
    report_iteration("CommentTypes")
    create_iteration("CommentTypes")

    # Truncate next table
    Comment.delete_all
    report_iteration("Comments")
    create_iteration("Comments")

    # Truncate next table
    ComparatorItem.delete_all
    report_iteration("ComparatorItems")
    create_iteration("ComparatorItems")

    # Truncate next table
    Comparator.delete_all
    report_iteration("Comparators")
    create_iteration("Comparators")

    # Truncate next table
    ComplaintStatus.delete_all
    report_iteration("ComplaintStatuses")
    create_iteration("ComplaintStatuses")

    # Truncate next table
    ComplaintType.delete_all
    report_iteration("ComplaintTypes")
    create_iteration("ComplaintTypes")

    # Truncate next table
    Complaint.delete_all
    report_iteration("Complaints")
    create_iteration("Complaints")

    # Truncate next table
    Connection.delete_all
    report_iteration("Connections")
    create_iteration("Connections")

    # Truncate next table
    # Category.delete_all, process tree structure
    sqlwhere = "
    not exists (
      select
        1
      from
        categories i
      where
            i.parent_id = categories.id
    )";
    while true
      counter = 0
      Category.find(:all, :conditions => [sqlwhere]).each do |item|
        item.delete
        counter += 1
      end
      break if counter == 0
    end
    report_iteration("Categories")
    create_iteration("Categories")

    # Truncate next table
    Contact.delete_all
    report_iteration("Contacts")
    create_iteration("Contacts")

    # Truncate next table
    ContactStatus.delete_all
    report_iteration("ContactStatuses")
    create_iteration("ContactStatuses")

    # Truncate next table
    ContactType.delete_all
    report_iteration("ContactTypes")
    create_iteration("ContactTypes")

    # Truncate next table
    Contract.delete_all
    report_iteration("Contracts")
    create_iteration("Contracts")

    # Truncate next table
    ContractType.delete_all
    report_iteration("ContractTypes")
    create_iteration("ContractTypes")

    # Truncate next table
    Country.delete_all
    report_iteration("Countries")
    create_iteration("Countries")

    # Truncate next table
    DelayedJob.delete_all
    report_iteration("DelayedJobs")
    create_iteration("DelayedJobs")

    # Truncate next table
    FavoriteProduct.delete_all
    report_iteration("FavoriteProducts")
    create_iteration("FavoriteProducts")

    # Truncate next table
    Favorite.delete_all
    report_iteration("Favorites")
    create_iteration("Favorites")

    # Truncate next table
    Feedback.delete_all
    report_iteration("Feedbacks")
    create_iteration("Feedbacks")

    # Truncate next table
    Friendship.delete_all
    report_iteration("Friendships")
    create_iteration("Friendships")

    # Truncate next table
    Group.delete_all
    report_iteration("Groups")
    create_iteration("Groups")

    # Truncate next table
    Instruction.delete_all
    report_iteration("Instructions")
    create_iteration("Instructions")

    # Truncate next table
    InvalidRoute.delete_all
    report_iteration("InvalidRoutes")
    create_iteration("InvalidRoutes")

    # Truncate next table
    Inventory.delete_all
    report_iteration("Inventories")
    create_iteration("Inventories")

    # Truncate next table
    Invitation.delete_all
    report_iteration("Invitations")
    create_iteration("Invitations")

    # Truncate next table
    Language.delete_all
    report_iteration("AddressTypes")
    create_iteration("AddressTypes")

    # Truncate next table
    Link.delete_all
    report_iteration("Links")
    create_iteration("Links")

    # Truncate next table
    # Manpage.delete_all, process tree structure
    sqlwhere = "
    not exists (
      select
        1
      from
        manpages i
      where
            i.parent_id = manpages.id
    )";
    while true
      counter = 0
      Manpage.find(:all, :conditions => [sqlwhere]).each do |item|
        item.delete
        counter += 1
      end
      break if counter == 0
    end
    report_iteration("Manpages")
    create_iteration("Manpages")

    # Truncate next table
    Meeting.delete_all
    report_iteration("Meetings")
    create_iteration("Meetings")

    # Truncate next table
    Message.delete_all
    report_iteration("Messages")
    create_iteration("Messages")

    # Truncate next table
    Note.delete_all
    report_iteration("Notes")
    create_iteration("Notes")

    # Truncate next table
    OpinionStatus.delete_all
    report_iteration("OpinionStatuses")
    create_iteration("OpinionStatuses")

    # Truncate next table
    Opinion.delete_all
    report_iteration("Opinions")
    create_iteration("Opinions")

    # Truncate next table
    Option.delete_all
    report_iteration("Options")
    create_iteration("Options")

    # Truncate next table
    OrderState.delete_all
    report_iteration("OrderStates")
    create_iteration("OrderStates")

    # Truncate next table
    OrderVariantProperty.delete_all
    report_iteration("OrderVariantProperties")
    create_iteration("OrderVariantProperties")

    # Truncate next table
    OrderVariant.delete_all
    report_iteration("OrderVariants")
    create_iteration("OrderVariants")

    # Truncate next table
    Order.delete_all
    report_iteration("Orders")
    create_iteration("Orders")

    # Truncate next table
    Pattern.delete_all
    report_iteration("Patterns")
    create_iteration("Patterns")

    # Truncate next table
    PatternType.delete_all
    report_iteration("PatternTypes")
    create_iteration("PatternTypes")

    # Truncate next table
    PaymentType.delete_all
    report_iteration("PaymentTypes")
    create_iteration("PaymentTypes")

    # Truncate next table
    Photo.delete_all
    report_iteration("Photos")
    create_iteration("Photos")

    # Truncate next table
    Polling.delete_all
    report_iteration("Pollings")
    create_iteration("Pollings")

    # Truncate next table
    Post.delete_all
    report_iteration("Posts")
    create_iteration("Posts")

    # Truncate next table
    VariantProperty.delete_all
    report_iteration("VariantProperties")
    create_iteration("VariantProperties")

    # Truncate next table
    Variant.delete_all
    report_iteration("Variants")
    create_iteration("Variants")

    # Truncate next table
    Currency.delete_all
    report_iteration("Currencies")
    create_iteration("Currencies")

    # Truncate next table
    ProductTypeProperty.delete_all
    report_iteration("ProductTypeProperties")
    create_iteration("ProductTypeProperties")

    # Truncate next table
    Property.delete_all
    report_iteration("Properties")
    create_iteration("Properties")

    # Truncate next table
    Datatype.delete_all
    report_iteration("Datatypes")
    create_iteration("Datatypes")

    # Truncate next table
    Promoitem.delete_all
    report_iteration("Promoitems")
    create_iteration("Promoitems")

    # Truncate next table
    # Product.delete_all, process tree structure
    sqlwhere = "
    not exists (
      select
        1
      from
        products i
      where
            i.parent_id = products.id
    )";
    while true
      counter = 0
      Product.find(:all, :conditions => [sqlwhere]).each do |item|
        item.delete
        counter += 1
      end
      break if counter == 0
    end
    report_iteration("Products")
    create_iteration("Products")

    # Truncate next table
    ProductType.delete_all
    report_iteration("ProductTypes")
    create_iteration("ProductTypes")

    # Truncate next table
    Privacy.delete_all
    report_iteration("Privacies")
    create_iteration("Privacies")

    # Truncate next table
    PrivacyMember.delete_all
    report_iteration("PrivacyMembers")
    create_iteration("PrivacyMembers")

    # Truncate next table
    PrivacyType.delete_all
    report_iteration("PrivacyTypes")
    create_iteration("PrivacyTypes")

    # Truncate next table
    PrivacyValue.delete_all
    report_iteration("PrivacyValues")
    create_iteration("PrivacyValues")

    # Truncate next table
    PromotionCalculator.delete_all
    report_iteration("PromotionCalculators")
    create_iteration("PromotionCalculators")

    # Truncate next table
    PromotionFunctor.delete_all
    report_iteration("PromotionFunctors")
    create_iteration("PromotionFunctors")

    # Truncate next table
    Promotion.delete_all
    report_iteration("Promotions")
    create_iteration("Promotions")

    # Truncate next table
    PromotionType.delete_all
    report_iteration("PromotionTypes")
    create_iteration("PromotionTypes")

    # Truncate next table
    Redirect.delete_all
    report_iteration("Redirects")
    create_iteration("Redirects")

    # Truncate next table
    RequestStatus.delete_all
    report_iteration("RequestStatuses")
    create_iteration("RequestStatuses")

    # Truncate next table
    Request.delete_all
    report_iteration("Requests")
    create_iteration("Requests")

    # Truncate next table
    Respondent.delete_all
    report_iteration("Respondents")
    create_iteration("Respondents")

    # Truncate next table
    RuntimeSetting.delete_all
    report_iteration("RuntimeSettings")
    create_iteration("RuntimeSettings")

    # Truncate next table
    Schedule.delete_all
    report_iteration("Schedules")
    create_iteration("Schedules")

    # Truncate next table
    #SchemaMigration.delete_all
    #report_iteration("SchemaMigrations")
    #create_iteration("SchemaMigrations")

    # Truncate next table
    Session.delete_all
    report_iteration("Sessions")
    create_iteration("Sessions")

    # Truncate next table
    Setting.delete_all
    report_iteration("Settings")
    create_iteration("Settings")

    # Truncate next table
    ShippingType.delete_all
    report_iteration("ShippingTypes")
    create_iteration("ShippingTypes")

    # Truncate next table
    ShoppingCart.delete_all
    report_iteration("ShoppingCarts")
    create_iteration("ShoppingCarts")

    # Truncate next table
    State.delete_all
    report_iteration("States")
    create_iteration("States")

    # Truncate next table
    Storehouse.delete_all
    report_iteration("Storehouses")
    create_iteration("Storehouses")

    # Truncate next table
    TagArticle.delete_all
    report_iteration("TagArticles")
    create_iteration("TagArticles")

    # Truncate next table
    TagProduct.delete_all
    report_iteration("TagProducts")
    create_iteration("TagProducts")

    # Truncate next table
    Tag.delete_all
    report_iteration("Tags")
    create_iteration("Tags")

    # Truncate next table
    TimetableStatus.delete_all
    report_iteration("TimetableStatuses")
    create_iteration("TimetableStatuses")

    # Truncate next table
    Timetable.delete_all
    report_iteration("Timetables")
    create_iteration("Timetables")

    # Truncate next table
    UserRole.delete_all
    report_iteration("UserRoles")
    create_iteration("UserRoles")

    # Truncate next table
    Role.delete_all
    report_iteration("Roles")
    create_iteration("Roles")

    # Truncate next table
    UserTag.delete_all
    report_iteration("UserTags")
    create_iteration("UserTags")

    # Truncate next table
    Vacancy.delete_all
    report_iteration("Vacancies")
    create_iteration("Vacancies")

    # Truncate next table
    Region.delete_all
    report_iteration("Regions")
    create_iteration("Regions")

    # Truncate next table
    Video.delete_all
    report_iteration("Videos")
    create_iteration("Videos")

    # Truncate next table
    ViewTypeItem.delete_all
    report_iteration("ViewTypeItems")
    create_iteration("ViewTypeItems")

    # Truncate next table
    ViewType.delete_all
    report_iteration("ViewTypes")
    create_iteration("ViewTypes")

    # Truncate next table
    View.delete_all
    report_iteration("Views")
    create_iteration("Views")

    # Truncate next table
    Website.delete_all
    report_iteration("Websites")
    create_iteration("Websites")

    # Truncate next table
    User.delete_all
    report_iteration("Users")
    create_iteration("Users")

    # Truncate next table
    UserStatus.delete_all
    report_iteration("UserStatuses")
    create_iteration("UserStatuses")
  end

  def truncate_admin_jobs
    # Truncate next table
    AdminJobReport.delete_all
    AdminJob.delete_all
  end

  def report_iteration(table)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "The table: #{table} is truncated successfully.")
  end

  def create_iteration(table)
    message = "The table: #{table} is truncated successfully."
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch, :message => message})
  end

end