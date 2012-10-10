Anecs::Application.routes.draw do

  themes_for_rails

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Application resources
  # resources :products

  # Configure AuthLogic
  resources :users, :sessions
  match 'login' => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'signup' => 'users#new', :as => :signup
  match 'resend' => 'users#resend', :as => :resend
  match 'forgot' => 'users#forgot', :as => :forgot
  match 'reset/:reset_code' => 'users#reset', :as => :reset
  match 'activate/:activation_code' => 'users#activate', :as => :activate

  # Route for captcha
  match 'captcha(/show)' => 'captcha#show', :as => :captcha

  # Routes to custom error pages
  match 'html_errors(/)' => 'html_errors#page500', :as => :html_errors
  match 'html_errors/page500' => 'html_errors#page500', :as => :html_errors_page500
  match 'html_errors(/page404)' => 'html_errors#page404', :as => :html_errors_page500

  # Regular routes

  # Application routes
  match 'photos(/pictures)' => 'photos#pictures', :as => :photos
  match 'manpages(/index)' => 'manpages#index', :as => :manpages

  # Routing for myaccount
  match 'myaccount(/index)' => 'myaccount/welcome/dashboard#index', :as => :myaccount
  match 'myaccount/welcome(/index)' => 'myaccount/welcome/dashboard#index', :as => :myaccount_welcome
  match 'myaccount/welcome/dashboard(/index)' => 'myaccount/welcome/dashboard#index', :as => :myaccount_welcome_dashboard
  match 'myaccount/welcome/myprofile(/index)' => 'myaccount/welcome/myprofile#index', :as => :myaccount_welcome_myprofile
  match 'myaccount/welcome/myprofile/edit' => 'myaccount/welcome/myprofile#edit', :as => :myaccount_welcome_edit_myprofile
  match 'myaccount/welcome/password(/index)' => 'myaccount/welcome/password#index', :as => :myaccount_welcome_password
  match 'myaccount/welcome/password/edit' => 'myaccount/welcome/password#edit', :as => :myaccount_welcome_edit_password
  match 'myaccount/welcome/complaints(/index)' => 'myaccount/welcome/complaints#index', :as => :myaccount_welcome_complaints
  match 'myaccount/shopping(/index)' => 'myaccount/shopping/dashboard#index', :as => :myaccount_shopping
  match 'myaccount/shopping/dashboard(/index)' => 'myaccount/shopping/dashboard#index', :as => :myaccount_shopping_dashboard
  match 'myaccount/community(/index)' => 'myaccount/community/dashboard#index', :as => :myaccount_community
  match 'myaccount/community/dashboard(/index)' => 'myaccount/community/dashboard#index', :as => :myaccount_community_dashboard

  # Routing for backoffice
  match 'backoffice(/index)' => 'backoffice/welcome/dashboard#index', :as => :backoffice
  match 'backoffice/welcome(/index)' => 'backoffice/welcome/dashboard#index', :as => :backoffice_welcome
  match 'backoffice/welcome/dashboard(/index)' => 'backoffice/welcome/dashboard#index', :as => :backoffice_welcome_dashboard
  match 'backoffice/welcome/tutorials(/index)' => 'backoffice/welcome/tutorials#index', :as => :backoffice_welcome_tutorials
  match 'backoffice/orders(/index)' => 'backoffice/orders/orders#index', :as => :backoffice_orders
  match 'backoffice/orders/orders(/index)' => 'backoffice/orders/orders#index', :as => :backoffice_orders_orders
  match 'backoffice/orders/customers(/index)' => 'backoffice/orders/customers#index', :as => :backoffice_orders_customers
  match 'backoffice/products(/index)' => 'backoffice/products/products/categories#index', :as => :backoffice_products
  match 'backoffice/products/products(/index)' => 'backoffice/products/products/categories#index', :as => :backoffice_products_products
  match 'backoffice/products/products/categories(/index)' => 'backoffice/products/products/categories#index', :as => :backoffice_products_products_categories
  match 'backoffice/products/products/products(/index)' => 'backoffice/products/products/products#index', :as => :backoffice_products_products_products
  match 'backoffice/products/products/connections(/index)' => 'backoffice/products/products/connections#index', :as => :backoffice_products_products_connections
  match 'backoffice/products/products/photos(/index)' => 'backoffice/products/products/photos#index', :as => :backoffice_products_products_photos
  match 'backoffice/products/products/agents(/index)' => 'backoffice/products/products/agents#index', :as => :backoffice_products_products_agents
  match 'backoffice/products/products/bookcases(/index)' => 'backoffice/products/products/bookcases#index', :as => :backoffice_products_products_bookcases
  match 'backoffice/products/products/instructions(/index)' => 'backoffice/products/products/instructions#index', :as => :backoffice_products_products_instructions
  match 'backoffice/products/products/variants(/index)' => 'backoffice/products/products/variants#index', :as => :backoffice_products_products_variants
  match 'backoffice/products/storehouses(/index)' => 'backoffice/products/storehouses/inventories#index', :as => :backoffice_products_storehouses
  match 'backoffice/products/storehouses/inventories(/index)' => 'backoffice/products/storehouses/inventories#index', :as => :backoffice_products_storehouses_inventories
  match 'backoffice/products/feedbacks(/index)' => 'backoffice/products/feedbacks/comments#index', :as => :backoffice_products_feedbacks
  match 'backoffice/products/feedbacks/comments(/index)' => 'backoffice/products/feedbacks/comments#index', :as => :backoffice_products_feedbacks_comments
  match 'backoffice/products/feedbacks/requests(/index)' => 'backoffice/products/feedbacks/requests#index', :as => :backoffice_products_feedbacks_requests
  match 'backoffice/products/properties(/index)' => 'backoffice/products/properties/patterns#index', :as => :backoffice_products_properties
  match 'backoffice/products/properties/patterns(/index)' => 'backoffice/products/properties/patterns#index', :as => :backoffice_products_properties_patterns
  match 'backoffice/products/properties/product_types(/index)' => 'backoffice/products/properties/product_types#index', :as => :backoffice_products_properties_product_types
  match 'backoffice/products/properties/properties(/index)' => 'backoffice/products/properties/properties#index', :as => :backoffice_products_properties_properties
  match 'backoffice/products/properties/product_type_properties(/index)' => 'backoffice/products/properties/product_type_properties#index', :as => :backoffice_products_properties_product_type_properties
  match 'backoffice/promotions(/index)' => 'backoffice/promotions/channels#index', :as => :backoffice_promotions
  match 'backoffice/promotions/channels(/index)' => 'backoffice/promotions/channels#index', :as => :backoffice_promotions_channels
  match 'backoffice/promotions/promotions(/index)' => 'backoffice/promotions/promotions#index', :as => :backoffice_promotions_promotions
  match 'backoffice/promotions/promoitems(/index)' => 'backoffice/promotions/promoitems#index', :as => :backoffice_promotions_promoitems
  match 'backoffice/promotions/contacts(/index)' => 'backoffice/promotions/contacts#index', :as => :backoffice_promotions_contacts
  match 'backoffice/website(/index)' => 'backoffice/website/contents/articles#index', :as => :backoffice_website
  match 'backoffice/website/contents(/index)' => 'backoffice/website/contents/articles#index', :as => :backoffice_website_contents
  match 'backoffice/website/contents/articles(/index)' => 'backoffice/website/contents/articles#index', :as => :backoffice_website_contents_articles
  match 'backoffice/website/contents/manpages(/index)' => 'backoffice/website/contents/manpages#index', :as => :backoffice_website_contents_manpages
  match 'backoffice/website/contents/vacancies(/index)' => 'backoffice/website/contents/vacancies#index', :as => :backoffice_website_contents_vacancies
  match 'backoffice/website/contents/redirects(/index)' => 'backoffice/website/contents/redirects#index', :as => :backoffice_website_contents_redirects
  match 'backoffice/website/contents/invalid_routes(/index)' => 'backoffice/website/contents/invalid_routes#index', :as => :backoffice_website_contents_invalid_routes
  match 'backoffice/website/feedbacks(/index)' => 'backoffice/website/feedbacks/feedbacks#index', :as => :backoffice_website_feedbacks
  match 'backoffice/website/feedbacks/feedbacks(/index)' => 'backoffice/website/feedbacks/feedbacks#index', :as => :backoffice_website_feedbacks_feedbacks
  match 'backoffice/website/feedbacks/callmebacks(/index)' => 'backoffice/website/feedbacks/callmebacks#index', :as => :backoffice_website_feedbacks_callmebacks
  match 'backoffice/website/feedbacks/complaints(/index)' => 'backoffice/website/feedbacks/complaints#index', :as => :backoffice_website_feedbacks_complaints
  match 'backoffice/website/feedbacks/pollings(/index)' => 'backoffice/website/feedbacks/pollings#index', :as => :backoffice_website_feedbacks_pollings
  match 'backoffice/website/design(/index)' => 'backoffice/website/design/themes#index', :as => :backoffice_website_design
  match 'backoffice/website/design/themes(/index)' => 'backoffice/website/design/themes#index', :as => :backoffice_website_design_themes
  match 'backoffice/website/design/savepoints(/index)' => 'backoffice/website/design/savepoints#index', :as => :backoffice_website_design_savepoints
  match 'backoffice/settings(/index)' => 'backoffice/settings/payment#index', :as => :backoffice_settings
  match 'backoffice/settings/payment(/index)' => 'backoffice/settings/payment#index', :as => :backoffice_settings_payment
  match 'backoffice/settings/shipping(/index)' => 'backoffice/settings/shipping#index', :as => :backoffice_settings_shipping
  match 'backoffice/settings/currencies(/index)' => 'backoffice/settings/currencies#index', :as => :backoffice_settings_currencies
  match 'backoffice/settings/languages(/index)' => 'backoffice/settings/languages#index', :as => :backoffice_settings_languages
  match 'backoffice/settings/regions(/index)' => 'backoffice/settings/regions#index', :as => :backoffice_settings_regions
  match 'backoffice/settings/storehouses(/index)' => 'backoffice/settings/storehouses#index', :as => :backoffice_settings_storehouses
  match 'backoffice/settings/runtime_settings(/index)' => 'backoffice/settings/runtime_settings#index', :as => :backoffice_settings_runtime_settings

  # Routing for framework
  match 'framework(/index)' => 'framework/heartbeat/heartbeat#index', :as => :framework
  match 'framework/heartbeat(/index)' => 'framework/heartbeat/heartbeat#index', :as => :framework_heartbeat
  match 'framework/heartbeat/heartbeat(/index)' => 'framework/heartbeat/heartbeat#index', :as => :framework_heartbeat_heartbeat
  match 'framework/heartbeat/websites(/index)' => 'framework/heartbeat/websites#index', :as => :framework_heartbeat_websites
  match 'framework/heartbeat/themes(/index)' => 'framework/heartbeat/themes#index', :as => :framework_heartbeat_themes
  match 'framework/heartbeat/users(/index)' => 'framework/heartbeat/users#index', :as => :framework_heartbeat_users
  match 'framework/heartbeat/user_roles(/index)' => 'framework/heartbeat/user_roles#index', :as => :framework_heartbeat_user_roles
  match 'framework/heartbeat/admin_jobs(/index)' => 'framework/heartbeat/admin_jobs#index', :as => :framework_heartbeat_admin_jobs
  match 'framework/heartbeat/delayed_jobs(/index)' => 'framework/heartbeat/delayed_jobs#index', :as => :framework_heartbeat_delayed_jobs
  match 'framework/settings(/index)' => 'framework/settings/countries#index', :as => :framework_settings
  match 'framework/settings/countries(/index)' => 'framework/settings/countries#index', :as => :framework_settings_countries
  match 'framework/settings/states(/index)' => 'framework/settings/states#index', :as => :framework_settings_states
  match 'framework/settings/languages(/index)' => 'framework/settings/languages#index', :as => :framework_settings_languages
  match 'framework/settings/currencies(/index)' => 'framework/settings/currencies#index', :as => :framework_settings_currencies
  match 'framework/settings/regions(/index)' => 'framework/settings/regions#index', :as => :framework_settings_regions
  match 'framework/settings/roles(/index)' => 'framework/settings/roles#index', :as => :framework_settings_roles
  match 'framework/settings/runtime_settings(/index)' => 'framework/settings/runtime_settings#index', :as => :framework_settings_runtime_settings
  match 'framework/constants(/index)' => 'framework/constants/user_statuses#index', :as => :framework_constants
  match 'framework/constants/user_statuses(/index)' => 'framework/constants/user_statuses#index', :as => :framework_constants_user_statuses
  match 'framework/constants/address_types(/index)' => 'framework/constants/address_types#index', :as => :framework_constants_address_types
  match 'framework/constants/alert_types(/index)' => 'framework/constants/alert_types#index', :as => :framework_constants_alert_types
  match 'framework/constants/announcement_statuses(/index)' => 'framework/constants/announcement_statuses#index', :as => :framework_constants_announcement_statuses
  match 'framework/constants/article_types(/index)' => 'framework/constants/article_types#index', :as => :framework_constants_article_types
  match 'framework/constants/category_types(/index)' => 'framework/constants/category_types#index', :as => :framework_constants_category_types
  match 'framework/constants/comment_statuses(/index)' => 'framework/constants/comment_statuses#index', :as => :framework_constants_comment_statuses
  match 'framework/constants/comment_types(/index)' => 'framework/constants/comment_types#index', :as => :framework_constants_comment_types
  match 'framework/constants/complaint_statuses(/index)' => 'framework/constants/complaint_statuses#index', :as => :framework_constants_complaint_statuses
  match 'framework/constants/complaint_types(/index)' => 'framework/constants/complaint_types#index', :as => :framework_constants_complaint_types
  match 'framework/constants/contact_types(/index)' => 'framework/constants/contact_types#index', :as => :framework_constants_contact_types
  match 'framework/constants/datatypes(/index)' => 'framework/constants/datatypes#index', :as => :framework_constants_datatypes
  match 'framework/constants/opinion_statuses(/index)' => 'framework/constants/opinion_statuses#index', :as => :framework_constants_opinion_statuses
  match 'framework/constants/order_states(/index)' => 'framework/constants/order_states#index', :as => :framework_constants_order_states
  match 'framework/constants/pattern_types(/index)' => 'framework/constants/pattern_types#index', :as => :framework_constants_pattern_types
  match 'framework/constants/payment_types(/index)' => 'framework/constants/payment_types#index', :as => :framework_constants_payment_types
  match 'framework/constants/privacy_types(/index)' => 'framework/constants/privacy_types#index', :as => :framework_constants_privacy_types
  match 'framework/constants/promotion_types(/index)' => 'framework/constants/promotion_types#index', :as => :framework_constants_promotion_types
  match 'framework/constants/request_statuses(/index)' => 'framework/constants/request_statuses#index', :as => :framework_constants_request_statuses
  match 'framework/constants/shipping_types(/index)' => 'framework/constants/shipping_types#index', :as => :framework_constants_shipping_types
  match 'framework/constants/timetable_statuses(/index)' => 'framework/constants/timetable_statuses#index', :as => :framework_constants_timetable_statuses
  match 'framework/constants/contract_types(/index)' => 'framework/constants/contract_types#index', :as => :framework_constants_contract_types

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"
  root :to => 'home#index'


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  # match ':controller(/:action(/:id(.:format)))'
  match ':controller(/:action)'


  # This is temporary solution, see url below for details
  # http://torqueo.net/handling-action-controller-routing-error-in-rails-3/
  # Read about problems: https://github.com/vidibus/vidibus-routing_error
  match "/html_errors" => 'html_errors#noroute'
  match "*path" => 'html_errors#noroute'
end
