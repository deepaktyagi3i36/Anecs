# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
# ::Rails.logger.error("...")

# Load dictinaries xml file
if File.exist?("#{::Rails.root.to_s}/db/dictionaries.xml")
  dictinaries = Nokogiri::XML(File.open("#{::Rails.root.to_s}/db/dictionaries.xml"))

  # Iterate across next objects
  dictinaries.xpath("//AddressType").each do |item|
    if AddressType.find_by_code(item["code"]).nil?
      AddressType.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//AdminJob").each do |item|
    if AdminJob.find_by_code(item["code"]).nil?
      AdminJob.create!(:name => item["name"], :code => item["code"], :about => item["about"], :job => item["job"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//AnnouncementStatus").each do |item|
    if AnnouncementStatus.find_by_code(item["code"]).nil?
      AnnouncementStatus.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//ArticleType").each do |item|
    if ArticleType.find_by_code(item["code"]).nil?
      ArticleType.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//CategoryType").each do |item|
    if CategoryType.find_by_code(item["code"]).nil?
      CategoryType.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//ChangeFreq").each do |item|
    if ChangeFreq.find_by_code(item["code"]).nil?
      ChangeFreq.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//CheckoutState").each do |item|
    if CheckoutState.find_by_code(item["code"]).nil?
      CheckoutState.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//CommentStatus").each do |item|
    if CommentStatus.find_by_code(item["code"]).nil?
      CommentStatus.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//ComplaintStatus").each do |item|
    if ComplaintStatus.find_by_code(item["code"]).nil?
      ComplaintStatus.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//ComplaintType").each do |item|
    if ComplaintType.find_by_code(item["code"]).nil?
      ComplaintType.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//ContactStatus").each do |item|
    if ContactStatus.find_by_code(item["code"]).nil?
      ContactStatus.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//ContractType").each do |item|
    if ContractType.find_by_code(item["code"]).nil?
      ContractType.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//Country").each do |item|
    if Country.find_by_code(item["code"]).nil?
      Country.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//Currency").each do |item|
    if Currency.find_by_code(item["code"]).nil?
      Currency.create!(:name => item["name"], :code => item["code"], :about => item["about"],
                       :sign => item["sign"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//ContractType").each do |item|
    if ContractType.find_by_code(item["code"]).nil?
      ContractType.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//Datatype").each do |item|
    if Datatype.find_by_code(item["code"]).nil?
      Datatype.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//Language").each do |item|
    if Language.find_by_code(item["code"]).nil?
      Language.create!(:name => item["name"], :code => item["code"], :about => item["about"],
        :locale => item["locale"], :enabled => item["enabled"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//OpinionStatus").each do |item|
    if OpinionStatus.find_by_code(item["code"]).nil?
      OpinionStatus.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//OrderState").each do |item|
    if OrderState.find_by_code(item["code"]).nil?
      OrderState.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//OrderState").each do |item|
    if OrderState.find_by_code(item["code"]).nil?
      OrderState.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//PatternType").each do |item|
    if PatternType.find_by_code(item["code"]).nil?
      PatternType.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//PaymentType").each do |item|
    if PaymentType.find_by_code(item["code"]).nil?
      PaymentType.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//PrivacyType").each do |item|
    if PrivacyType.find_by_code(item["code"]).nil?
      PrivacyType.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//PromotionType").each do |item|
    if PromotionType.find_by_code(item["code"]).nil?
      PromotionType.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//RequestStatus").each do |item|
    if RequestStatus.find_by_code(item["code"]).nil?
      RequestStatus.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//Role").each do |item|
    if Role.find_by_code(item["code"]).nil?
      Role.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//RuntimeSetting").each do |item|
    if RuntimeSetting.find_by_code(item["code"]).nil?
      RuntimeSetting.create!(:name => item["name"], :code => item["code"], :about => item["about"],
        :value => item["value"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//ShippingType").each do |item|
    if ShippingType.find_by_code(item["code"]).nil?
      ShippingType.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//State").each do |item|
    if State.find_by_code(item["code"]).nil?
      State.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//TimetableStatus").each do |item|
    if TimetableStatus.find_by_code(item["code"]).nil?
      TimetableStatus.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end

  # Iterate across next objects
  dictinaries.xpath("//UserStatus").each do |item|
    if UserStatus.find_by_code(item["code"]).nil?
      UserStatus.create!(:name => item["name"], :code => item["code"], :about => item["about"])
    end
  end
end # File.exists?()


# Create a subclass of Nokogiri::XML::SAX::Document
# and implement the events we care about:
class Database < Nokogiri::XML::SAX::Document
  # ::Rails.logger.error("...")

  attr_accessor :website
  attr_accessor :user
  attr_accessor :product
  attr_accessor :product_type

  def start_element name, attrs = []
    case name
      when "Website"
        create_website(name, attrs)
      when "WebsiteLanguage"
        create_website_language(name, attrs)
      when "WebsiteCurrency"
        create_website_currency(name, attrs)
      when "Theme"
        create_theme(name, attrs)
      when "User"
        create_user(name, attrs)
      when "UserRole"
        create_user_role(name, attrs)
      when "Complaint"
        create_user_complaint(name, attrs)
      when "Article"
        create_article(name, attrs)
      when "Manpage"
        create_manpage(name, attrs)
      when "Property"
        create_property(name, attrs)
      when "ProductType"
        create_product_type(name, attrs)
      when "ProductTypeProperty"
        create_product_type_property(name, attrs)
      when "Category"
        create_category(name, attrs)
      when "Product"
        create_product(name, attrs)
      when "Photo"
        create_photo(name, attrs)
      when "Connection"
        create_connection(name, attrs)
      when "Instruction"
        create_instruction(name, attrs)
      when "Order"
        create_order(name, attrs)
      when "Feedback"
        create_feedback(name, attrs)
      when "Callmeback"
        create_callmeback(name, attrs)
      else
        not_found = true
        elements = ["Database", "Websites", "WebsiteLanguages", "WebsiteCurrencies", "Themes", "Users", "Complaints",
                    "UserRoles", "Articles", "Manpages", "Proposals", "Properties", "ProductTypes",
                    "ProductTypeProperties", "Categories", "Products", "Photos", "Connections", "Instructions",
                    "Orders", "Feedbacks", "Callmebacks"]
        elements.each do |element|
          if(element == name)
            not_found = false
            break
          end
        end
        # Report about error
        raise "Uknown element with name: #{name} and attributes: #{attrs.to_s}" if not_found
    end
  end

  def end_element name
  end

  def create_website(name, attrs)
    @website = Website.find_by_code(attrs[1][1])
    if @website.nil?
      @website = Website.create!(:name => attrs[0][1], :code => attrs[1][1], :about =>  attrs[2][1],
                                 :domain => attrs[3][1], :primary => attrs[4][1], :enabled =>  attrs[5][1])
    end
  end

  def create_website_language(name, attrs)
    language = Language.find_by_code(attrs[0][1])
    if WebsiteLanguage.find_by_website_id_and_language_id(@website.id, language.id).nil?
      WebsiteLanguage.create!(:website_id => @website.id, :language_id => language.id)
    end
  end

  def create_website_currency(name, attrs)
    currency = Currency.find_by_code(attrs[0][1])
    if WebsiteCurrency.find_by_website_id_and_currency_id(@website.id, currency.id).nil?
      WebsiteCurrency.create!(:website_id => @website.id, :currency_id => currency.id)
    end
  end

  def create_theme(name, attrs)
    if Theme.find_by_code(attrs[2][1]).nil?
      website = Website.find_by_code(attrs[0][1])
      Theme.create!(:website_id => website.id, :name => attrs[1][1], :code => attrs[2][1],
                    :about =>  attrs[3][1], :primary => attrs[4][1], :enabled =>  attrs[5][1])
    end
  end

  def create_user(name, attrs)
    @user = User.find_by_login(attrs[6][1])
    if @user.nil?
      website = Website.find_by_code(attrs[0][1])
      user_status = UserStatus.find_by_code(attrs[1][1])
      @user = User.create!(:website_id => (website ? website.id : nil), :user_status_id => user_status.id,
                       :firstname => attrs[2][1], :middlename => attrs[3][1],  :lastname => attrs[4][1],
                       :nickname => attrs[5][1],  :login => attrs[6][1],  :email => attrs[7][1],
                       :allow_email => attrs[8][1], :password => attrs[6][1],
                       :password_confirmation => attrs[6][1], :active => attrs[9][1])
    end
  end

  def create_user_role(name, attrs)
    role = Role.find_by_code(attrs[0][1])
    if UserRole.find_by_user_id_and_role_id(@user.id, role.id).nil?
      UserRole.create!(:user_id => @user.id, :role_id => role.id)
    end
  end

  def create_user_complaint(name, attrs)
  end

  def create_article(name, attrs)
    if Article.find_by_code(attrs[3][1]).nil?
      website = Website.find_by_code(attrs[0][1])
      article_type = ArticleType.find_by_code(attrs[1][1])
      Article.create!(:website_id => website.id, :article_type_id => article_type.id, :name => attrs[2][1],
                      :code => attrs[3][1], :annotation => attrs[4][1], :content => attrs[5][1],
                      :pagetitle => attrs[6][1], :metakeywords => attrs[7][1], :metadescription => attrs[8][1],
                      :permalink => attrs[9][1],  :slug => attrs[10][1],
                      :ancestry => (attrs[11][1].nil? || attrs[11][1].blank? ? nil : attrs[11][1]),
                      :weight => attrs[12][1], :enabled => attrs[13][1])
    end
  end

  def create_manpage(name, attrs)
    if Manpage.find_by_code(attrs[2][1]).nil?
      website = Website.find_by_code(attrs[0][1])
      Manpage.create!(:website_id => website.id, :name => attrs[1][1], :code => attrs[2][1],
                      :annotation => attrs[3][1], :content => attrs[4][1], :pagetitle => attrs[5][1],
                      :metakeywords => attrs[6][1], :metadescription => attrs[7][1],
                      :permalink => attrs[8][1],  :slug => attrs[9][1],
                      :ancestry => (attrs[10][1].nil? || attrs[10][1].blank? ? nil : attrs[10][1]),
                      :weight => attrs[11][1], :enabled => attrs[12][1])
    end
  end

  def create_property(name, attrs)
    if Property.find_by_code(attrs[3][1]).nil?
      website = Website.find_by_code(attrs[0][1])
      datatype = Datatype.find_by_code(attrs[1][1])
      ProductType.create!(:website_id => website.id, :datatype_id => datatype.id, :name => attrs[2][1],
                          :code => attrs[3][1], :about => attrs[4][1])
    end
  end

  def create_product_type(name, attrs)
    if ProductType.find_by_code(attrs[3][1]).nil?
      website = Website.find_by_code(attrs[0][1])
      ProductType.create!(:website_id => website.id, :name => attrs[1][1],
                          :code => attrs[2][1], :about => attrs[3][1])
    end
  end

  def create_product_type_property(name, attrs)
    property = Property.find_by_code(attrs[0][1])
    if ProductTypeProperty.find_by_product_type_id_and_property_id(@product_type.id, property.id).nil?
      ProductTypeProperty.create!(:product_type_id => @product_type.id, :property_id => property.id)
      end
  end

  def create_category(name, attrs)
    if Category.find_by_code(attrs[3][1]).nil?
      website = Website.find_by_code(attrs[0][1])
      Category.create!(:website_id => website.id, :name => attrs[1][1], :code => attrs[2][1], :about => attrs[3][1],
                       :permalink => attrs[4][1],  :slug => attrs[5][1],
                       :ancestry => (attrs[6][1].nil? || attrs[6][1].blank? ? nil : attrs[6][1]),
                       :weight => attrs[7][1], :enabled => attrs[8][1])
    end
  end

  def create_product(name, attrs)
    @product = Product.find_by_code(attrs[6][1])
    if @product.nil?
      website = Website.find_by_code(attrs[0][1])
      product_type = ProductType.find_by_code(attrs[1][1])
      @product = Product.create!(:website_id => website.id,  :product_type_id => product_type.id, :name => attrs[3][1],
                                 :code => attrs[4][1], :sketch => attrs[5][1], :about => attrs[6][1],
                                 :rating => attrs[7][1], :metakeywords => attrs[8][1],
                                 :metadescription => attrs[9][1], :wwwaddress => attrs[10][1],
                                 :permalink => attrs[11][1],  :slug => attrs[12][1],
                                 :ancestry => (attrs[13][1].nil? || attrs[13][1].blank? ? nil : attrs[13][1]),
                                 :weight => attrs[14][1], :enabled => attrs[15][1])

    end
  end

  def create_photo(name, attrs)
    # Photo[["primary", "1"], ["picture_file_name", "arufanov.png"], ["picture_content_type", "image/png"], ["picture_file_size", "19671"], ["picture_updated_at", "2012-04-23 11:06:31 +0400"]]
  end

  def create_connection(name, attrs)
    category = Category.find_by_code(attrs[0][1])
    if Connection.find_by_product_id_and_category_id(@product.id, category.id).nil?
      Connection.create!(:product_id => @product.id, :category_id => category.id, :bubble => attrs[1][1])
    end
  end

  def create_instruction(name, attrs)
  end

  def create_order(name, attrs)
  end

  def create_feedback(name, attrs)
  end

  def create_callmeback(name, attrs)
  end
end

# Load database xml file
if File.exist?("#{::Rails.root.to_s}/db/database.xml")
  # Create our parser, Send some XML to the parser
  parser = Nokogiri::XML::SAX::Parser.new(Database.new)
  parser.parse(File.read("#{::Rails.root.to_s}/db/database.xml"))
end # File.exists?()


# Invalid routes
if InvalidRoute.find_by_pattern("^\/administrator(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/administrator(.*)"
end
if InvalidRoute.find_by_pattern("^\/admin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/admin(.*)"
end
if InvalidRoute.find_by_pattern("^\/apple(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/apple(.*)"
end
if InvalidRoute.find_by_pattern("^\/appConf.htm(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/appConf.htm(.*)"
end
if InvalidRoute.find_by_pattern("^\/class(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/class(.*)"
end
if InvalidRoute.find_by_pattern("^\/cms(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/cms(.*)"
end
if InvalidRoute.find_by_pattern("^\/common(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/common(.*)"
end
if InvalidRoute.find_by_pattern("^\/components(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/components(.*)"
end
if InvalidRoute.find_by_pattern("^\/database(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/database(.*)"
end
if InvalidRoute.find_by_pattern("^\/datenbank(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/datenbank(.*)"
end
if InvalidRoute.find_by_pattern("^\/db.php(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/db.php(.*)"
end
if InvalidRoute.find_by_pattern("^\/dbadmin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/dbadmin(.*)"
end
if InvalidRoute.find_by_pattern("^\/fwkfor(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/fwkfor(.*)"
end
if InvalidRoute.find_by_pattern("^\/gallery(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/gallery(.*)"
end
if InvalidRoute.find_by_pattern("^\/global(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/global(.*)"
end
if InvalidRoute.find_by_pattern("^\/icons(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/icons(.*)"
end
if InvalidRoute.find_by_pattern("^\/icons.php(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/icons.php(.*)"
end
if InvalidRoute.find_by_pattern("^\/idle(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/idle(.*)"
end
if InvalidRoute.find_by_pattern("^\/index.php(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/index.php(.*)"
end
if InvalidRoute.find_by_pattern("^\/info(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/info(.*)"
end
if InvalidRoute.find_by_pattern("^\/jmx-console(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/jmx-console(.*)"
end
if InvalidRoute.find_by_pattern("^\/js(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/js(.*)"
end
if InvalidRoute.find_by_pattern("^\/mambots(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/mambots(.*)"
end
if InvalidRoute.find_by_pattern("^\/manager(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/manager(.*)"
end
if InvalidRoute.find_by_pattern("^\/modules(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/modules(.*)"
end
if InvalidRoute.find_by_pattern("^\/muieblackcat(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/muieblackcat(.*)"
end
if InvalidRoute.find_by_pattern("^\/myadmin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/myadmin(.*)"
end
if InvalidRoute.find_by_pattern("^\/MyAdmin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/MyAdmin(.*)"
end
if InvalidRoute.find_by_pattern("^\/mysql(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/mysql(.*)"
end
if InvalidRoute.find_by_pattern("^\/mysqladmin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/mysqladmin(.*)"
end
if InvalidRoute.find_by_pattern("^\/mysql-admin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/mysql-admin(.*)"
end
if InvalidRoute.find_by_pattern("^\/mysqlmanager(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/mysqlmanager(.*)"
end
if InvalidRoute.find_by_pattern("^\/padmin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/padmin(.*)"
end
if InvalidRoute.find_by_pattern("^\/p\/m\/a(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/p\/m\/a(.*)"
end
if InvalidRoute.find_by_pattern("^\/PHP(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/PHP(.*)"
end
if InvalidRoute.find_by_pattern("^\/php(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/php(.*)"
end
if InvalidRoute.find_by_pattern("^\/phpadmin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/phpadmin(.*)"
end
if InvalidRoute.find_by_pattern("^\/phpadmin.php(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/phpadmin.php(.*)"
end
if InvalidRoute.find_by_pattern("^\/phpmanager(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/phpmanager(.*)"
end
if InvalidRoute.find_by_pattern("^\/phpmyadmin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/phpmyadmin(.*)"
end
if InvalidRoute.find_by_pattern("^\/phpMyAdmin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/phpMyAdmin(.*)"
end
if InvalidRoute.find_by_pattern("^\/php-myadmin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/php-myadmin(.*)"
end
if InvalidRoute.find_by_pattern("^\/phpmy-admin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/phpmy-admin(.*)"
end
if InvalidRoute.find_by_pattern("^\/php-my-admin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/php-my-admin(.*)"
end
if InvalidRoute.find_by_pattern("^\/phpMyAdmin3(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/phpMyAdmin3(.*)"
end
if InvalidRoute.find_by_pattern("^\/phpmyadmin3(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/phpmyadmin3(.*)"
end
if InvalidRoute.find_by_pattern("^\/phpThumb(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/phpThumb(.*)"
end
if InvalidRoute.find_by_pattern("^\/pma(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/pma(.*)"
end
if InvalidRoute.find_by_pattern("^\/PMA(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/PMA(.*)"
end
if InvalidRoute.find_by_pattern("^\/pma2005(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/pma2005(.*)"
end
if InvalidRoute.find_by_pattern("^\/PMA2005(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/PMA2005(.*)"
end
if InvalidRoute.find_by_pattern("^\/projec(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/projec(.*)"
end
if InvalidRoute.find_by_pattern("^\/scripts(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/scripts(.*)"
end
if InvalidRoute.find_by_pattern("^\/sql(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/sql(.*)"
end
if InvalidRoute.find_by_pattern("^\/sqlmanager(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/sqlmanager(.*)"
end
if InvalidRoute.find_by_pattern("^\/sqlweb(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/sqlweb(.*)"
end
if InvalidRoute.find_by_pattern("^\/staticfiles(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/staticfiles(.*)"
end
if InvalidRoute.find_by_pattern("^\/thumb(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/thumb(.*)"
end
if InvalidRoute.find_by_pattern("^\/typo3.php(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/typo3.php(.*)"
end
if InvalidRoute.find_by_pattern("^\/ucp.php(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/ucp.php(.*)"
end
if InvalidRoute.find_by_pattern("^\/user\/soap(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/user\/soap(.*)"
end
if InvalidRoute.find_by_pattern("^\/w00tw00t(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/w00tw00t(.*)"
end
if InvalidRoute.find_by_pattern("^\/web(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/web(.*)"
end
if InvalidRoute.find_by_pattern("^\/web.php(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/web.php(.*)"
end
if InvalidRoute.find_by_pattern("^\/webadmin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/webadmin(.*)"
end
if InvalidRoute.find_by_pattern("^\/webdb(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/webdb(.*)"
end
if InvalidRoute.find_by_pattern("^\/websql(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/websql(.*)"
end
if InvalidRoute.find_by_pattern("^\/wp-content(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/wp-content(.*)"
end
if InvalidRoute.find_by_pattern("^\/wp-includes(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/wp-includes(.*)"
end
if InvalidRoute.find_by_pattern("^\/xampp.php(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/xampp.php(.*)"
end
if InvalidRoute.find_by_pattern("^\/zadmin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/zadmin(.*)"
end
if InvalidRoute.find_by_pattern("^\/color(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/color(.*)"
end
if InvalidRoute.find_by_pattern("^\/memberlist(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/memberlist(.*)"
end
if InvalidRoute.find_by_pattern("^\/faq(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/faq(.*)"
end
if InvalidRoute.find_by_pattern("^\/docs(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/docs(.*)"
end
if InvalidRoute.find_by_pattern("^\/index.cgi(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/index.cgi(.*)"
end
if InvalidRoute.find_by_pattern("^\/page.cgi(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/page.cgi(.*)"
end
if InvalidRoute.find_by_pattern("^\/request.cgi(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/request.cgi(.*)"
end
if InvalidRoute.find_by_pattern("^\/report.cgi(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/report.cgi(.*)"
end
if InvalidRoute.find_by_pattern("^\/enter_bug.cgi(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/enter_bug.cgi(.*)"
end
if InvalidRoute.find_by_pattern("^\/enter_bug.cgi(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/enter_bug.cgi(.*)"
end
if InvalidRoute.find_by_pattern("^\/cpanel(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/cpanel(.*)"
end
if InvalidRoute.find_by_pattern("^\/admm(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/admm(.*)"
end
if InvalidRoute.find_by_pattern("^\/databaseadmin(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/databaseadmin(.*)"
end
if InvalidRoute.find_by_pattern("^\/icons(.*)").nil?
  InvalidRoute.create! :priority => 9, :pattern => "^\/icons(.*)"
end

# Insert predefined redirects
if Redirect.find_by_pattern("^\/page404").nil?
  Redirect.create! :priority => 9, :pattern => "^\/page404",
                   :httpurl => "/htmlerrors/page404", :status => 301,
                   :flash => "This page moved permanently."
end
if Redirect.find_by_pattern("^\/page422").nil?
  Redirect.create! :priority => 9, :pattern => "^\/page422",
                   :httpurl => "/htmlerrors/page422", :status => 301,
                   :flash => "This page moved permanently."
end
if Redirect.find_by_pattern("^\/page500").nil?
  Redirect.create! :priority => 9, :pattern => "^\/page500",
                   :httpurl => "/htmlerrors/page500", :status => 301,
                   :flash => "This page moved permanently."
end
