# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100319100155) do

  create_table "address_types", :force => true do |t|
    t.string   "name",       :limit => 128,                :null => false
    t.string   "code",       :limit => 128,                :null => false
    t.string   "about",      :limit => 128,                :null => false
    t.integer  "enabled",                   :default => 1, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "address_types", ["code"], :name => "index_address_types_on_code", :unique => true
  add_index "address_types", ["name"], :name => "index_address_types_on_name", :unique => true

  create_table "addresses", :force => true do |t|
    t.string   "name",            :limit => 128,                 :null => false
    t.integer  "address_type_id"
    t.integer  "user_id"
    t.string   "full_name",       :limit => 1024,                :null => false
    t.string   "phone",           :limit => 32,                  :null => false
    t.string   "extra_phone",     :limit => 32
    t.string   "street_address1", :limit => 128,                 :null => false
    t.string   "street_address2", :limit => 128
    t.string   "city",            :limit => 128,                 :null => false
    t.integer  "country_id",                                     :null => false
    t.string   "zip",             :limit => 16
    t.integer  "default",                         :default => 0, :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "addresses", ["address_type_id"], :name => "addresses_address_type_id_fk"
  add_index "addresses", ["country_id"], :name => "addresses_country_id_fk"
  add_index "addresses", ["name"], :name => "index_addresses_on_name"
  add_index "addresses", ["user_id"], :name => "index_addresses_on_user_id"

  create_table "admin_job_reports", :force => true do |t|
    t.integer  "admin_job_id",                 :null => false
    t.integer  "runbatch",                     :null => false
    t.string   "message",      :limit => 5000, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "admin_job_reports", ["admin_job_id"], :name => "admin_job_reports_admin_job_id_fk"

  create_table "admin_jobs", :force => true do |t|
    t.string   "name",       :limit => 128,                 :null => false
    t.string   "code",       :limit => 128,                 :null => false
    t.string   "about",      :limit => 128,                 :null => false
    t.string   "job",        :limit => 128,                 :null => false
    t.integer  "success",                    :default => 0, :null => false
    t.string   "exception",  :limit => 5000
    t.datetime "begin_at"
    t.datetime "finish_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "admin_jobs", ["code"], :name => "index_admin_jobs_on_code", :unique => true
  add_index "admin_jobs", ["job"], :name => "index_admin_jobs_on_job", :unique => true
  add_index "admin_jobs", ["name"], :name => "index_admin_jobs_on_name", :unique => true

  create_table "agents", :force => true do |t|
    t.integer  "product_id", :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "agents", ["product_id", "user_id"], :name => "index_agents_on_product_id_and_user_id", :unique => true
  add_index "agents", ["user_id"], :name => "agents_user_id_fk"

  create_table "album_photos", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "albums", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "alert_members", :force => true do |t|
    t.integer  "alert_id",   :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "alert_members", ["alert_id", "user_id"], :name => "index_alert_members_on_alert_id_and_user_id", :unique => true
  add_index "alert_members", ["user_id"], :name => "alert_members_user_id_fk"

  create_table "alert_types", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "alert_types", ["code"], :name => "index_alert_types_on_code", :unique => true
  add_index "alert_types", ["name"], :name => "index_alert_types_on_name", :unique => true

  create_table "alert_values", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "alert_values", ["code"], :name => "index_alert_values_on_code", :unique => true
  add_index "alert_values", ["name"], :name => "index_alert_values_on_name", :unique => true

  create_table "alerts", :force => true do |t|
    t.integer  "user_id",        :null => false
    t.integer  "alert_type_id",  :null => false
    t.integer  "alert_value_id", :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "alerts", ["alert_type_id"], :name => "alerts_alert_type_id_fk"
  add_index "alerts", ["alert_value_id"], :name => "alerts_alert_value_id_fk"
  add_index "alerts", ["user_id", "alert_type_id"], :name => "index_alerts_on_user_id_and_alert_type_id", :unique => true

  create_table "announcement_statuses", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "announcement_statuses", ["code"], :name => "index_announcement_statuses_on_code", :unique => true
  add_index "announcement_statuses", ["name"], :name => "index_announcement_statuses_on_name", :unique => true

  create_table "announcements", :force => true do |t|
    t.integer  "product_id",                             :null => false
    t.integer  "announcement_status_id",                 :null => false
    t.integer  "user_id",                                :null => false
    t.integer  "author_id"
    t.string   "title",                  :limit => 256,  :null => false
    t.string   "titlel",                 :limit => 256,  :null => false
    t.string   "body",                   :limit => 4000, :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "announcements", ["announcement_status_id"], :name => "index_announcements_on_announcement_status_id"
  add_index "announcements", ["author_id"], :name => "index_announcements_on_author_id"
  add_index "announcements", ["product_id"], :name => "index_announcements_on_product_id"
  add_index "announcements", ["user_id"], :name => "index_announcements_on_user_id"

  create_table "answers", :force => true do |t|
    t.integer  "polling_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "answers", ["polling_id"], :name => "index_answers_on_polling_id"

  create_table "article_types", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "article_types", ["code"], :name => "index_article_types_on_code", :unique => true
  add_index "article_types", ["name"], :name => "index_article_types_on_name", :unique => true

  create_table "articles", :force => true do |t|
    t.integer  "website_id",                                           :null => false
    t.integer  "article_type_id",                                      :null => false
    t.string   "name",            :limit => 128,                       :null => false
    t.string   "namel",           :limit => 128,                       :null => false
    t.string   "code",            :limit => 64,                        :null => false
    t.string   "annotation",      :limit => 5000
    t.text     "content",         :limit => 2147483647
    t.string   "pagetitle",       :limit => 128,                       :null => false
    t.string   "metakeywords",                                         :null => false
    t.text     "metadescription", :limit => 16777215,                  :null => false
    t.string   "permalink"
    t.string   "slug"
    t.string   "ancestry"
    t.integer  "weight",                                :default => 0, :null => false
    t.integer  "enabled",                               :default => 0, :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "articles", ["ancestry"], :name => "index_articles_on_ancestry"
  add_index "articles", ["article_type_id"], :name => "articles_article_type_id_fk"
  add_index "articles", ["code"], :name => "index_articles_on_code", :unique => true
  add_index "articles", ["metakeywords"], :name => "index_articles_on_metakeywords", :unique => true
  add_index "articles", ["name"], :name => "index_articles_on_name", :unique => true
  add_index "articles", ["pagetitle"], :name => "index_articles_on_pagetitle", :unique => true
  add_index "articles", ["website_id"], :name => "articles_website_id_fk"

  create_table "audios", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bookcases", :force => true do |t|
    t.integer  "product_id",                  :null => false
    t.integer  "article_id",                  :null => false
    t.string   "annotation", :limit => 16384, :null => false
    t.integer  "position",                    :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "bookcases", ["article_id"], :name => "bookcases_article_id_fk"
  add_index "bookcases", ["product_id", "article_id"], :name => "index_bookcases_on_product_id_and_article_id", :unique => true

  create_table "buy_offers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "callmebacks", :force => true do |t|
    t.integer  "website_id",                       :null => false
    t.integer  "user_id"
    t.integer  "contact_type_id",                  :null => false
    t.integer  "contact_status_id",                :null => false
    t.string   "phone",             :limit => 128, :null => false
    t.string   "title",             :limit => 128, :null => false
    t.string   "body",              :limit => 512, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "callmebacks", ["contact_status_id"], :name => "index_callmebacks_on_contact_status_id"
  add_index "callmebacks", ["contact_type_id"], :name => "index_callmebacks_on_contact_type_id"
  add_index "callmebacks", ["user_id"], :name => "index_callmebacks_on_user_id"
  add_index "callmebacks", ["website_id"], :name => "callmebacks_website_id_fk"

  create_table "cart_items", :force => true do |t|
    t.integer  "shopping_cart_id",                :null => false
    t.integer  "variant_id",                      :null => false
    t.integer  "quantity",                        :null => false
    t.integer  "saved_for_later",  :default => 0, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "cart_items", ["shopping_cart_id", "saved_for_later", "variant_id"], :name => "index_on_shopping_cart_id_save_for_later_variant_id", :unique => true
  add_index "cart_items", ["variant_id"], :name => "cart_items_variant_id_fk"

  create_table "categories", :force => true do |t|
    t.integer  "website_id",                                 :null => false
    t.integer  "proposal_id",                                :null => false
    t.string   "code",        :limit => 128,                 :null => false
    t.string   "name",        :limit => 128,                 :null => false
    t.string   "namel",       :limit => 128,                 :null => false
    t.string   "about",       :limit => 5000,                :null => false
    t.string   "permalink"
    t.string   "slug"
    t.string   "ancestry"
    t.integer  "weight",                      :default => 0, :null => false
    t.integer  "enabled",                     :default => 0, :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "categories", ["ancestry"], :name => "index_categories_on_ancestry"
  add_index "categories", ["code"], :name => "index_categories_on_code", :unique => true
  add_index "categories", ["proposal_id"], :name => "categories_proposal_id_fk"
  add_index "categories", ["website_id"], :name => "categories_website_id_fk"

  create_table "category_types", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "category_types", ["code"], :name => "index_category_types_on_code", :unique => true
  add_index "category_types", ["name"], :name => "index_category_types_on_name", :unique => true

  create_table "change_freqs", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "change_freqs", ["code"], :name => "index_change_freqs_on_code", :unique => true
  add_index "change_freqs", ["name"], :name => "index_change_freqs_on_name", :unique => true

  create_table "checkout_states", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "checkout_states", ["code"], :name => "index_checkout_states_on_code", :unique => true
  add_index "checkout_states", ["name"], :name => "index_checkout_states_on_name", :unique => true

  create_table "comment_statuses", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "comment_statuses", ["code"], :name => "index_comment_statuses_on_code", :unique => true
  add_index "comment_statuses", ["name"], :name => "index_comment_statuses_on_name", :unique => true

  create_table "comment_types", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "comment_types", ["code"], :name => "index_comment_types_on_code", :unique => true
  add_index "comment_types", ["name"], :name => "index_comment_types_on_name", :unique => true

  create_table "comments", :force => true do |t|
    t.integer  "product_id",                        :null => false
    t.integer  "comment_status_id",                 :null => false
    t.integer  "comment_type_id",                   :null => false
    t.integer  "user_id",                           :null => false
    t.integer  "author_id"
    t.string   "title",             :limit => 256,  :null => false
    t.string   "titlel",            :limit => 256,  :null => false
    t.string   "body",              :limit => 4000, :null => false
    t.integer  "rating",                            :null => false
    t.integer  "useful",                            :null => false
    t.integer  "useless",                           :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "comments", ["author_id"], :name => "index_comments_on_author_id"
  add_index "comments", ["comment_status_id"], :name => "index_comments_on_comment_status_id"
  add_index "comments", ["comment_type_id"], :name => "comments_comment_type_id_fk"
  add_index "comments", ["product_id"], :name => "index_comments_on_product_id"
  add_index "comments", ["titlel"], :name => "index_comments_on_titlel", :length => {"titlel"=>255}
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "comparator_items", :force => true do |t|
    t.integer  "comparator_id", :null => false
    t.integer  "variant_id",    :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "comparator_items", ["comparator_id", "variant_id"], :name => "index_comparator_items_on_comparator_id_and_variant_id", :unique => true
  add_index "comparator_items", ["variant_id"], :name => "comparator_items_variant_id_fk"

  create_table "comparators", :force => true do |t|
    t.integer  "website_id", :null => false
    t.integer  "user_id"
    t.integer  "session_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comparators", ["session_id"], :name => "index_comparators_on_session_id", :unique => true
  add_index "comparators", ["user_id"], :name => "index_comparators_on_user_id", :unique => true
  add_index "comparators", ["website_id"], :name => "comparators_website_id_fk"

  create_table "complaint_statuses", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "complaint_statuses", ["code"], :name => "index_complaint_statuses_on_code", :unique => true
  add_index "complaint_statuses", ["name"], :name => "index_complaint_statuses_on_name", :unique => true

  create_table "complaint_types", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "complaint_types", ["code"], :name => "index_complaint_types_on_code", :unique => true
  add_index "complaint_types", ["name"], :name => "index_complaint_types_on_name", :unique => true

  create_table "complaints", :force => true do |t|
    t.integer  "user_id",                            :null => false
    t.integer  "complaint_type_id",                  :null => false
    t.integer  "complaint_status_id",                :null => false
    t.string   "title",               :limit => 128, :null => false
    t.string   "body",                :limit => 512, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "complaints", ["complaint_status_id"], :name => "index_complaints_on_complaint_status_id"
  add_index "complaints", ["complaint_type_id"], :name => "index_complaints_on_complaint_type_id"
  add_index "complaints", ["user_id"], :name => "index_complaints_on_user_id"

  create_table "connections", :force => true do |t|
    t.integer  "category_id",                :null => false
    t.integer  "product_id",                 :null => false
    t.integer  "bubble",      :default => 1, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "connections", ["category_id", "product_id"], :name => "index_connections_on_category_id_and_product_id", :unique => true
  add_index "connections", ["product_id"], :name => "connections_product_id_fk"

  create_table "contact_statuses", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "contact_statuses", ["code"], :name => "index_contact_statuses_on_code", :unique => true
  add_index "contact_statuses", ["name"], :name => "index_contact_statuses_on_name", :unique => true

  create_table "contact_types", :force => true do |t|
    t.string   "name",       :limit => 128,                :null => false
    t.string   "code",       :limit => 128,                :null => false
    t.string   "about",      :limit => 128,                :null => false
    t.integer  "enabled",                   :default => 1, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "contact_types", ["code"], :name => "index_contact_types_on_code", :unique => true
  add_index "contact_types", ["name"], :name => "index_contact_types_on_name", :unique => true

  create_table "contacts", :force => true do |t|
    t.integer  "product_id",                                              :null => false
    t.string   "name",       :limit => 64,                                :null => false
    t.string   "about",      :limit => 256,                               :null => false
    t.decimal  "latitude",                  :precision => 9, :scale => 6, :null => false
    t.decimal  "longitude",                 :precision => 9, :scale => 6, :null => false
    t.integer  "zoom",                                                    :null => false
    t.string   "title",      :limit => 64,                                :null => false
    t.string   "body",       :limit => 256,                               :null => false
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  add_index "contacts", ["product_id"], :name => "contacts_product_id_fk"

  create_table "contract_types", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "contract_types", ["code"], :name => "index_contract_types_on_code", :unique => true
  add_index "contract_types", ["name"], :name => "index_contract_types_on_name", :unique => true

  create_table "contracts", :force => true do |t|
    t.integer  "contract_type_id", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "contracts", ["contract_type_id"], :name => "contracts_contract_type_id_fk"

  create_table "countries", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "countries", ["code"], :name => "index_countries_on_code", :unique => true
  add_index "countries", ["name"], :name => "index_countries_on_name", :unique => true

  create_table "currencies", :force => true do |t|
    t.string   "name",       :limit => 128,                :null => false
    t.string   "code",       :limit => 128,                :null => false
    t.string   "about",      :limit => 128,                :null => false
    t.string   "sign",       :limit => 8,                  :null => false
    t.integer  "enabled",                   :default => 0, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "currencies", ["code"], :name => "index_currencies_on_code", :unique => true
  add_index "currencies", ["name"], :name => "index_currencies_on_name", :unique => true
  add_index "currencies", ["sign"], :name => "index_currencies_on_sign", :unique => true

  create_table "datatypes", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "datatypes", ["code"], :name => "index_datatypes_on_code", :unique => true
  add_index "datatypes", ["name"], :name => "index_datatypes_on_name", :unique => true

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.string   "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "favorite_products", :force => true do |t|
    t.integer  "favorite_id", :null => false
    t.integer  "product_id",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "favorite_products", ["favorite_id", "product_id"], :name => "index_favorite_products_on_favorite_id_and_product_id", :unique => true
  add_index "favorite_products", ["product_id"], :name => "favorite_products_product_id_fk"

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "favorites", ["user_id"], :name => "index_favorites_on_user_id", :unique => true

  create_table "feedbacks", :force => true do |t|
    t.integer  "website_id",                       :null => false
    t.integer  "user_id"
    t.integer  "contact_type_id",                  :null => false
    t.integer  "contact_status_id",                :null => false
    t.string   "title",             :limit => 128, :null => false
    t.string   "body",              :limit => 512, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "feedbacks", ["contact_status_id"], :name => "index_feedbacks_on_contact_status_id"
  add_index "feedbacks", ["contact_type_id"], :name => "index_feedbacks_on_contact_type_id"
  add_index "feedbacks", ["user_id"], :name => "index_feedbacks_on_user_id"
  add_index "feedbacks", ["website_id"], :name => "feedbacks_website_id_fk"

  create_table "friendships", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "instructions", :force => true do |t|
    t.integer  "product_id",                  :null => false
    t.integer  "position",                    :null => false
    t.integer  "pattern_id"
    t.string   "title",      :limit => 256,   :null => false
    t.string   "body",       :limit => 16384, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "instructions", ["pattern_id"], :name => "instructions_pattern_id_fk"
  add_index "instructions", ["product_id", "position"], :name => "index_instructions_on_product_id_and_position", :unique => true

  create_table "invalid_routes", :force => true do |t|
    t.integer  "priority",                                 :null => false
    t.string   "pattern",    :limit => 128,                :null => false
    t.integer  "enabled",                   :default => 1, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "invalid_routes", ["pattern"], :name => "index_invalid_routes_on_pattern", :unique => true

  create_table "inventories", :force => true do |t|
    t.integer  "storehouse_id",                :null => false
    t.integer  "variant_id",                   :null => false
    t.integer  "quantity",      :default => 0, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "inventories", ["storehouse_id", "variant_id"], :name => "index_inventories_on_storehouse_id_and_variant_id", :unique => true
  add_index "inventories", ["variant_id"], :name => "inventories_variant_id_fk"

  create_table "invitations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "languages", :force => true do |t|
    t.string   "name",       :limit => 128,                :null => false
    t.string   "code",       :limit => 128,                :null => false
    t.string   "about",      :limit => 128,                :null => false
    t.string   "locale",     :limit => 8,                  :null => false
    t.integer  "enabled",                   :default => 0, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "languages", ["code"], :name => "index_languages_on_code", :unique => true
  add_index "languages", ["locale"], :name => "index_languages_on_locale", :unique => true
  add_index "languages", ["name"], :name => "index_languages_on_name", :unique => true

  create_table "links", :force => true do |t|
    t.integer  "product_id",        :null => false
    t.integer  "expert_product_id", :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "links", ["expert_product_id"], :name => "links_expert_product_id_fk"
  add_index "links", ["product_id", "expert_product_id"], :name => "index_links_on_product_id_and_expert_product_id", :unique => true

  create_table "manpages", :force => true do |t|
    t.integer  "website_id",                                           :null => false
    t.string   "name",            :limit => 128,                       :null => false
    t.string   "namel",           :limit => 128,                       :null => false
    t.string   "code",            :limit => 128,                       :null => false
    t.string   "annotation",      :limit => 5000
    t.text     "content",         :limit => 2147483647
    t.string   "pagetitle",       :limit => 128,                       :null => false
    t.string   "permalink"
    t.string   "slug"
    t.string   "metakeywords",                                         :null => false
    t.text     "metadescription", :limit => 16777215,                  :null => false
    t.string   "ancestry"
    t.integer  "weight",                                :default => 0, :null => false
    t.integer  "enabled",                               :default => 0, :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "manpages", ["ancestry"], :name => "index_manpages_on_ancestry"
  add_index "manpages", ["code"], :name => "index_manpages_on_code", :unique => true
  add_index "manpages", ["metakeywords"], :name => "index_manpages_on_metakeywords", :unique => true
  add_index "manpages", ["name"], :name => "index_manpages_on_name", :unique => true
  add_index "manpages", ["pagetitle"], :name => "index_manpages_on_pagetitle", :unique => true
  add_index "manpages", ["website_id"], :name => "manpages_website_id_fk"

  create_table "meetings", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "opinion_statuses", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "opinion_statuses", ["code"], :name => "index_opinion_statuses_on_code", :unique => true
  add_index "opinion_statuses", ["name"], :name => "index_opinion_statuses_on_name", :unique => true

  create_table "opinions", :force => true do |t|
    t.integer  "article_id",                        :null => false
    t.integer  "opinion_status_id",                 :null => false
    t.integer  "user_id",                           :null => false
    t.string   "title",             :limit => 256,  :null => false
    t.string   "body",              :limit => 4000, :null => false
    t.integer  "rating",                            :null => false
    t.integer  "useful",                            :null => false
    t.integer  "useless",                           :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "opinions", ["article_id"], :name => "opinions_article_id_fk"
  add_index "opinions", ["opinion_status_id"], :name => "opinions_opinion_status_id_fk"
  add_index "opinions", ["user_id"], :name => "opinions_user_id_fk"

  create_table "options", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "options", ["code"], :name => "index_options_on_code", :unique => true
  add_index "options", ["name"], :name => "index_options_on_name", :unique => true

  create_table "order_states", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "order_states", ["code"], :name => "index_order_states_on_code", :unique => true
  add_index "order_states", ["name"], :name => "index_order_states_on_name", :unique => true

  create_table "order_variant_properties", :force => true do |t|
    t.integer  "order_variant_id", :null => false
    t.string   "property_nm",      :null => false
    t.string   "value",            :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "order_variant_properties", ["order_variant_id", "property_nm"], :name => "index_order_variant_properties_on_ordvar_id_and_prop_nm", :unique => true

  create_table "order_variants", :force => true do |t|
    t.integer  "order_id",                                                                   :null => false
    t.integer  "variant_id",                                                                 :null => false
    t.string   "product_nm",  :limit => 128,                                                 :null => false
    t.string   "variant_nm",  :limit => 128,                                                 :null => false
    t.integer  "quantity",                                                                   :null => false
    t.integer  "currency_id",                                                                :null => false
    t.decimal  "price",                      :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at",                                                                 :null => false
    t.datetime "updated_at",                                                                 :null => false
  end

  add_index "order_variants", ["currency_id"], :name => "order_variants_currency_id_fk"
  add_index "order_variants", ["order_id", "variant_id"], :name => "index_order_variants_on_order_id_and_variant_id", :unique => true
  add_index "order_variants", ["variant_id"], :name => "order_variants_variant_id_fk"

  create_table "orders", :force => true do |t|
    t.integer  "website_id",                                                       :null => false
    t.string   "name",              :limit => 128,                                 :null => false
    t.string   "namel",             :limit => 128,                                 :null => false
    t.string   "about",             :limit => 128
    t.integer  "session_id"
    t.integer  "region_id",                                                        :null => false
    t.integer  "order_state_id",                                                   :null => false
    t.integer  "user_id"
    t.integer  "shipping_type_id"
    t.integer  "payment_type_id"
    t.integer  "address_id"
    t.integer  "checkout_state_id",                                                :null => false
    t.integer  "total_items",                                                      :null => false
    t.decimal  "total_price",                       :precision => 10, :scale => 2, :null => false
    t.string   "shipping_address",  :limit => 1024
    t.string   "email",             :limit => 128
    t.string   "user_name",         :limit => 128
    t.string   "notes",             :limit => 128
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
  end

  add_index "orders", ["address_id"], :name => "orders_address_id_fk"
  add_index "orders", ["checkout_state_id"], :name => "orders_checkout_state_id_fk"
  add_index "orders", ["name"], :name => "index_orders_on_name"
  add_index "orders", ["order_state_id"], :name => "orders_order_state_id_fk"
  add_index "orders", ["payment_type_id"], :name => "orders_payment_type_id_fk"
  add_index "orders", ["region_id"], :name => "orders_region_id_fk"
  add_index "orders", ["session_id"], :name => "index_orders_on_session_id", :unique => true
  add_index "orders", ["shipping_type_id"], :name => "orders_shipping_type_id_fk"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"
  add_index "orders", ["website_id"], :name => "orders_website_id_fk"

  create_table "pattern_types", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "pattern_types", ["code"], :name => "index_pattern_types_on_code", :unique => true
  add_index "pattern_types", ["name"], :name => "index_pattern_types_on_name", :unique => true

  create_table "patterns", :force => true do |t|
    t.integer  "website_id",                      :null => false
    t.integer  "pattern_type_id",                 :null => false
    t.string   "name",            :limit => 128,  :null => false
    t.string   "title",                           :null => false
    t.string   "body",            :limit => 4000, :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "patterns", ["name"], :name => "index_patterns_on_name", :unique => true
  add_index "patterns", ["pattern_type_id"], :name => "patterns_pattern_type_id_fk"
  add_index "patterns", ["website_id"], :name => "patterns_website_id_fk"

  create_table "payment_types", :force => true do |t|
    t.string   "name",       :limit => 128,                :null => false
    t.string   "code",       :limit => 128,                :null => false
    t.string   "about",      :limit => 128,                :null => false
    t.integer  "enabled",                   :default => 1, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "payment_types", ["code"], :name => "index_payment_types_on_code", :unique => true
  add_index "payment_types", ["name"], :name => "index_payment_types_on_name", :unique => true

  create_table "photos", :force => true do |t|
    t.integer  "product_id",                          :null => false
    t.integer  "primary",              :default => 0, :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "photos", ["product_id"], :name => "index_photos_on_product_id"

  create_table "pollings", :force => true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.string   "matchurl",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pollings", ["product_id"], :name => "pollings_product_id_fk"
  add_index "pollings", ["user_id"], :name => "pollings_user_id_fk"

  create_table "posts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "presentations", :force => true do |t|
    t.integer  "website_id",                :null => false
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "presentations", ["website_id", "code"], :name => "index_presentations_on_website_id_and_code", :unique => true
  add_index "presentations", ["website_id", "name"], :name => "index_presentations_on_website_id_and_name", :unique => true

  create_table "privacies", :force => true do |t|
    t.integer  "user_id",          :null => false
    t.integer  "privacy_type_id",  :null => false
    t.integer  "privacy_value_id", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "privacies", ["privacy_type_id"], :name => "privacies_privacy_type_id_fk"
  add_index "privacies", ["privacy_value_id"], :name => "privacies_privacy_value_id_fk"
  add_index "privacies", ["user_id", "privacy_type_id"], :name => "index_privacies_on_user_id_and_privacy_type_id", :unique => true

  create_table "privacy_members", :force => true do |t|
    t.integer  "privacy_id", :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "privacy_members", ["privacy_id", "user_id"], :name => "index_privacy_members_on_privacy_id_and_user_id", :unique => true
  add_index "privacy_members", ["user_id"], :name => "privacy_members_user_id_fk"

  create_table "privacy_types", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "privacy_types", ["code"], :name => "index_privacy_types_on_code", :unique => true
  add_index "privacy_types", ["name"], :name => "index_privacy_types_on_name", :unique => true

  create_table "privacy_values", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "privacy_values", ["code"], :name => "index_privacy_values_on_code", :unique => true
  add_index "privacy_values", ["name"], :name => "index_privacy_values_on_name", :unique => true

  create_table "product_type_properties", :force => true do |t|
    t.integer  "product_type_id", :null => false
    t.integer  "property_id",     :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "product_type_properties", ["product_type_id", "property_id"], :name => "producttp_properties_on_producttp_id_and_property_id", :unique => true
  add_index "product_type_properties", ["property_id"], :name => "product_type_properties_property_id_fk"

  create_table "product_types", :force => true do |t|
    t.integer  "website_id",                 :null => false
    t.integer  "proposal_id",                :null => false
    t.string   "name",        :limit => 128, :null => false
    t.string   "code",        :limit => 128, :null => false
    t.string   "about",       :limit => 128, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "product_types", ["proposal_id"], :name => "product_types_proposal_id_fk"
  add_index "product_types", ["website_id", "code"], :name => "index_product_types_on_website_id_and_code", :unique => true
  add_index "product_types", ["website_id", "name"], :name => "index_product_types_on_website_id_and_name", :unique => true

  create_table "products", :force => true do |t|
    t.integer  "website_id",                                                                        :null => false
    t.integer  "proposal_id",                                                                       :null => false
    t.integer  "view_type_id",                                                                      :null => false
    t.integer  "presentation_id",                                                                   :null => false
    t.integer  "product_type_id",                                                                   :null => false
    t.string   "code",            :limit => 128,                                                    :null => false
    t.string   "name",            :limit => 128,                                                    :null => false
    t.string   "namel",           :limit => 128,                                                    :null => false
    t.string   "sketch",          :limit => 1024
    t.string   "about",           :limit => 8192,                                                   :null => false
    t.decimal  "rating",                              :precision => 10, :scale => 0, :default => 0, :null => false
    t.string   "metakeywords"
    t.text     "metadescription", :limit => 16777215
    t.string   "wwwaddress"
    t.string   "permalink"
    t.string   "slug"
    t.integer  "weight",                                                             :default => 0, :null => false
    t.string   "ancestry"
    t.integer  "enabled",                                                            :default => 0, :null => false
    t.datetime "created_at",                                                                        :null => false
    t.datetime "updated_at",                                                                        :null => false
  end

  add_index "products", ["ancestry"], :name => "index_products_on_ancestry"
  add_index "products", ["code"], :name => "index_products_on_code", :unique => true
  add_index "products", ["metakeywords"], :name => "index_products_on_metakeywords", :unique => true
  add_index "products", ["permalink"], :name => "index_products_on_permalink", :unique => true
  add_index "products", ["presentation_id"], :name => "products_presentation_id_fk"
  add_index "products", ["product_type_id"], :name => "products_product_type_id_fk"
  add_index "products", ["proposal_id"], :name => "index_products_on_proposal_id"
  add_index "products", ["view_type_id"], :name => "products_view_type_id_fk"
  add_index "products", ["website_id"], :name => "products_website_id_fk"

  create_table "promoitems", :force => true do |t|
    t.integer  "product_id",   :null => false
    t.integer  "promotion_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "promoitems", ["product_id", "promotion_id"], :name => "index_promoitems_on_product_id_and_promotion_id", :unique => true
  add_index "promoitems", ["promotion_id"], :name => "promoitems_promotion_id_fk"

  create_table "promotion_calculators", :force => true do |t|
    t.integer  "promotion_id",                :null => false
    t.string   "name",         :limit => 128, :null => false
    t.string   "about",        :limit => 128, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "promotion_calculators", ["name"], :name => "index_promotion_calculators_on_name", :unique => true
  add_index "promotion_calculators", ["promotion_id"], :name => "index_promotion_calculators_on_promotion_id"

  create_table "promotion_functors", :force => true do |t|
    t.integer  "promotion_id",                :null => false
    t.string   "name",         :limit => 128, :null => false
    t.string   "about",        :limit => 128, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "promotion_functors", ["name"], :name => "index_promotion_functors_on_name", :unique => true
  add_index "promotion_functors", ["promotion_id"], :name => "index_promotion_functors_on_promotion_id"

  create_table "promotion_types", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "promotion_types", ["code"], :name => "index_promotion_types_on_code", :unique => true
  add_index "promotion_types", ["name"], :name => "index_promotion_types_on_name", :unique => true

  create_table "promotions", :force => true do |t|
    t.integer  "website_id",                       :null => false
    t.integer  "promotion_type_id",                :null => false
    t.string   "code",              :limit => 128, :null => false
    t.string   "name",              :limit => 128, :null => false
    t.string   "about",             :limit => 128, :null => false
    t.string   "title",             :limit => 128, :null => false
    t.string   "body",              :limit => 512, :null => false
    t.datetime "begin_dt",                         :null => false
    t.datetime "finish_dt",                        :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "promotions", ["code"], :name => "index_promotions_on_code", :unique => true
  add_index "promotions", ["name"], :name => "index_promotions_on_name", :unique => true
  add_index "promotions", ["promotion_type_id"], :name => "promotions_promotion_type_id_fk"
  add_index "promotions", ["website_id"], :name => "promotions_website_id_fk"

  create_table "properties", :force => true do |t|
    t.integer  "website_id",                 :null => false
    t.string   "name",        :limit => 128, :null => false
    t.string   "code",        :limit => 128, :null => false
    t.string   "about",       :limit => 128, :null => false
    t.integer  "datatype_id",                :null => false
    t.integer  "proposal_id",                :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "properties", ["datatype_id"], :name => "properties_datatype_id_fk"
  add_index "properties", ["website_id", "code"], :name => "index_properties_on_website_id_and_code", :unique => true
  add_index "properties", ["website_id", "name"], :name => "index_properties_on_website_id_and_name", :unique => true

  create_table "proposals", :force => true do |t|
    t.integer  "website_id",                :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "name",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "proposals", ["website_id", "code"], :name => "index_proposals_on_website_id_and_code", :unique => true
  add_index "proposals", ["website_id", "name"], :name => "index_proposals_on_website_id_and_name", :unique => true

  create_table "redirects", :force => true do |t|
    t.integer  "priority",                                    :null => false
    t.string   "pattern",    :limit => 128,                   :null => false
    t.string   "httpurl",    :limit => 128,  :default => "/", :null => false
    t.integer  "status",                     :default => 301, :null => false
    t.string   "flash",      :limit => 1024
    t.integer  "enabled",                    :default => 1,   :null => false
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "redirects", ["pattern"], :name => "index_redirects_on_pattern", :unique => true

  create_table "regions", :force => true do |t|
    t.integer  "website_id",                               :null => false
    t.string   "name",       :limit => 128,                :null => false
    t.string   "code",       :limit => 128,                :null => false
    t.string   "about",      :limit => 128,                :null => false
    t.string   "title",      :limit => 128,                :null => false
    t.string   "phone",      :limit => 128,                :null => false
    t.integer  "enabled",                   :default => 0, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "regions", ["code"], :name => "index_regions_on_code", :unique => true
  add_index "regions", ["name"], :name => "index_regions_on_name", :unique => true
  add_index "regions", ["title"], :name => "index_regions_on_title", :unique => true
  add_index "regions", ["website_id"], :name => "regions_website_id_fk"

  create_table "request_statuses", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "request_statuses", ["code"], :name => "index_request_statuses_on_code", :unique => true
  add_index "request_statuses", ["name"], :name => "index_request_statuses_on_name", :unique => true

  create_table "requests", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "product_id",                        :null => false
    t.integer  "request_status_id",                 :null => false
    t.integer  "user_id",                           :null => false
    t.integer  "author_id"
    t.string   "title",             :limit => 256,  :null => false
    t.string   "titlel",            :limit => 256,  :null => false
    t.string   "body",              :limit => 4000, :null => false
    t.integer  "rating",                            :null => false
    t.integer  "useful",                            :null => false
    t.integer  "useless",                           :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "requests", ["author_id"], :name => "index_requests_on_author_id"
  add_index "requests", ["parent_id"], :name => "requests_parent_id_fk"
  add_index "requests", ["product_id"], :name => "index_requests_on_product_id"
  add_index "requests", ["request_status_id"], :name => "index_requests_on_request_status_id"
  add_index "requests", ["titlel"], :name => "index_requests_on_titlel", :length => {"titlel"=>255}
  add_index "requests", ["user_id"], :name => "index_requests_on_user_id"

  create_table "respondents", :force => true do |t|
    t.integer  "polling_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "respondents", ["polling_id"], :name => "index_respondents_on_polling_id"

  create_table "roles", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "roles", ["code"], :name => "index_roles_on_code", :unique => true
  add_index "roles", ["name"], :name => "index_roles_on_name", :unique => true

  create_table "runtime_settings", :force => true do |t|
    t.integer  "website_id"
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.string   "value",      :limit => 256, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "runtime_settings", ["code"], :name => "index_runtime_settings_on_code", :unique => true
  add_index "runtime_settings", ["name"], :name => "index_runtime_settings_on_name", :unique => true
  add_index "runtime_settings", ["website_id"], :name => "runtime_settings_website_id_fk"

  create_table "schedules", :force => true do |t|
    t.integer  "timetable_id",                :null => false
    t.datetime "begin_dt",                    :null => false
    t.datetime "finish_dt",                   :null => false
    t.string   "monday",       :limit => 256
    t.string   "tuesday",      :limit => 256
    t.string   "wednesday",    :limit => 256
    t.string   "thursday",     :limit => 256
    t.string   "friday",       :limit => 256
    t.string   "saturday",     :limit => 256
    t.string   "sunday",       :limit => 256
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "schedules", ["timetable_id"], :name => "index_schedules_on_timetable_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "settings", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "option_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "settings", ["option_id"], :name => "settings_option_id_fk"
  add_index "settings", ["user_id", "option_id"], :name => "index_settings_on_user_id_and_option_id", :unique => true

  create_table "shipping_types", :force => true do |t|
    t.string   "name",       :limit => 128,                :null => false
    t.string   "code",       :limit => 128,                :null => false
    t.string   "about",      :limit => 128,                :null => false
    t.integer  "enabled",                   :default => 1, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "shipping_types", ["code"], :name => "index_shipping_types_on_code", :unique => true
  add_index "shipping_types", ["name"], :name => "index_shipping_types_on_name", :unique => true

  create_table "shopping_carts", :force => true do |t|
    t.integer  "website_id", :null => false
    t.integer  "user_id"
    t.integer  "session_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "shopping_carts", ["session_id"], :name => "index_shopping_carts_on_session_id", :unique => true
  add_index "shopping_carts", ["user_id"], :name => "index_shopping_carts_on_user_id", :unique => true
  add_index "shopping_carts", ["website_id"], :name => "shopping_carts_website_id_fk"

  create_table "states", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "states", ["code"], :name => "index_states_on_code", :unique => true
  add_index "states", ["name"], :name => "index_states_on_name", :unique => true

  create_table "static_contents", :force => true do |t|
    t.integer  "website_id",                                                                       :null => false
    t.integer  "change_freq_id",                                                                   :null => false
    t.string   "pageurl",                                                                          :null => false
    t.string   "about"
    t.decimal  "priority",       :precision => 10, :scale => 2, :default => 0.5,                   :null => false
    t.datetime "lastmod",                                       :default => '2012-10-10 14:25:53', :null => false
    t.integer  "enabled",                                       :default => 1,                     :null => false
    t.datetime "created_at",                                                                       :null => false
    t.datetime "updated_at",                                                                       :null => false
  end

  add_index "static_contents", ["change_freq_id"], :name => "static_contents_change_freq_id_fk"
  add_index "static_contents", ["website_id"], :name => "index_static_contents_on_website_id"

  create_table "storehouses", :force => true do |t|
    t.integer  "website_id",                               :null => false
    t.string   "name",       :limit => 128,                :null => false
    t.string   "about",      :limit => 128,                :null => false
    t.integer  "region_id",                                :null => false
    t.integer  "enabled",                   :default => 0, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "storehouses", ["name"], :name => "index_storehouses_on_name", :unique => true
  add_index "storehouses", ["region_id"], :name => "index_storehouses_on_region_id"
  add_index "storehouses", ["website_id"], :name => "storehouses_website_id_fk"

  create_table "tag_articles", :force => true do |t|
    t.integer  "tag_id",     :null => false
    t.integer  "article_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tag_articles", ["article_id"], :name => "tag_articles_article_id_fk"
  add_index "tag_articles", ["tag_id", "article_id"], :name => "index_tag_articles_on_tag_id_and_article_id", :unique => true

  create_table "tag_products", :force => true do |t|
    t.integer  "tag_id",     :null => false
    t.integer  "product_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tag_products", ["product_id"], :name => "tag_products_product_id_fk"
  add_index "tag_products", ["tag_id", "product_id"], :name => "index_tag_products_on_tag_id_and_product_id", :unique => true

  create_table "tags", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "themes", :force => true do |t|
    t.integer  "website_id",                               :null => false
    t.string   "name",       :limit => 128,                :null => false
    t.string   "code",       :limit => 128,                :null => false
    t.string   "about",      :limit => 128,                :null => false
    t.integer  "primary",                   :default => 0, :null => false
    t.integer  "enabled",                   :default => 0, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "themes", ["code"], :name => "index_themes_on_code", :unique => true
  add_index "themes", ["name"], :name => "index_themes_on_name", :unique => true
  add_index "themes", ["website_id"], :name => "index_themes_on_website_id"

  create_table "timetable_statuses", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "timetable_statuses", ["code"], :name => "index_timetable_statuses_on_code", :unique => true
  add_index "timetable_statuses", ["name"], :name => "index_timetable_statuses_on_name", :unique => true

  create_table "timetables", :force => true do |t|
    t.integer  "product_id",          :null => false
    t.integer  "timetable_status_id", :null => false
    t.integer  "user_id",             :null => false
    t.string   "name",                :null => false
    t.string   "about",               :null => false
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "timetables", ["product_id", "name"], :name => "index_timetables_on_product_id_and_name", :unique => true
  add_index "timetables", ["timetable_status_id"], :name => "timetables_timetable_status_id_fk"
  add_index "timetables", ["user_id"], :name => "timetables_user_id_fk"

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "role_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_roles", ["role_id"], :name => "user_roles_role_id_fk"
  add_index "user_roles", ["user_id", "role_id"], :name => "index_user_roles_on_user_id_and_role_id", :unique => true

  create_table "user_statuses", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "user_statuses", ["code"], :name => "index_user_statuses_on_code", :unique => true
  add_index "user_statuses", ["name"], :name => "index_user_statuses_on_name", :unique => true

  create_table "user_tags", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_tags", ["tag_id", "user_id"], :name => "index_user_tags_on_tag_id_and_user_id", :unique => true
  add_index "user_tags", ["user_id"], :name => "user_tags_user_id_fk"

  create_table "users", :force => true do |t|
    t.integer  "website_id"
    t.integer  "user_status_id",                       :null => false
    t.string   "firstname",                            :null => false
    t.string   "middlename"
    t.string   "lastname",                             :null => false
    t.string   "nickname",                             :null => false
    t.integer  "allow_email",       :default => 0,     :null => false
    t.string   "email",                                :null => false
    t.string   "login",                                :null => false
    t.string   "crypted_password",                     :null => false
    t.string   "password_salt",                        :null => false
    t.string   "persistence_token",                    :null => false
    t.boolean  "active",            :default => false, :null => false
    t.string   "perishable_token",                     :null => false
    t.integer  "login_count",       :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"
  add_index "users", ["user_status_id"], :name => "users_user_status_id_fk"
  add_index "users", ["website_id"], :name => "users_website_id_fk"

  create_table "vacancies", :force => true do |t|
    t.integer  "website_id",                                :null => false
    t.integer  "region_id",                                 :null => false
    t.string   "name",       :limit => 128,                 :null => false
    t.string   "namel",      :limit => 128,                 :null => false
    t.string   "about",      :limit => 128,                 :null => false
    t.string   "title",                                     :null => false
    t.string   "body",       :limit => 4000,                :null => false
    t.integer  "enabled",                    :default => 0, :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "vacancies", ["name"], :name => "index_vacancies_on_name", :unique => true
  add_index "vacancies", ["region_id"], :name => "index_vacancies_on_region_id"
  add_index "vacancies", ["website_id"], :name => "vacancies_website_id_fk"

  create_table "variant_properties", :force => true do |t|
    t.integer  "variant_id",  :null => false
    t.integer  "property_id", :null => false
    t.string   "value",       :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "variant_properties", ["property_id"], :name => "variant_properties_property_id_fk"
  add_index "variant_properties", ["variant_id", "property_id"], :name => "index_variant_properties_on_variant_id_and_property_id", :unique => true

  create_table "variants", :force => true do |t|
    t.integer  "product_id",                                                                 :null => false
    t.string   "name",        :limit => 128,                                                 :null => false
    t.string   "namel",       :limit => 128,                                                 :null => false
    t.integer  "currency_id",                                                                :null => false
    t.decimal  "price",                      :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer  "enabled",                                                   :default => 0,   :null => false
    t.datetime "created_at",                                                                 :null => false
    t.datetime "updated_at",                                                                 :null => false
  end

  add_index "variants", ["currency_id"], :name => "variants_currency_id_fk"
  add_index "variants", ["product_id"], :name => "index_variants_on_product_id"

  create_table "videos", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "view_type_items", :force => true do |t|
    t.integer  "view_type_id", :null => false
    t.integer  "view_id",      :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "view_type_items", ["view_id"], :name => "view_type_items_view_id_fk"
  add_index "view_type_items", ["view_type_id", "view_id"], :name => "index_view_type_items_on_view_type_id_and_view_id", :unique => true

  create_table "view_types", :force => true do |t|
    t.integer  "website_id",                :null => false
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "view_types", ["website_id", "code"], :name => "index_view_types_on_website_id_and_code", :unique => true
  add_index "view_types", ["website_id", "name"], :name => "index_view_types_on_website_id_and_name", :unique => true

  create_table "views", :force => true do |t|
    t.integer  "website_id",                :null => false
    t.string   "name",       :limit => 128, :null => false
    t.string   "code",       :limit => 128, :null => false
    t.string   "about",      :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "views", ["website_id", "code"], :name => "index_views_on_website_id_and_code", :unique => true
  add_index "views", ["website_id", "name"], :name => "index_views_on_website_id_and_name", :unique => true

  create_table "website_currencies", :force => true do |t|
    t.integer  "website_id",                 :null => false
    t.integer  "currency_id",                :null => false
    t.integer  "primary",     :default => 0, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "website_currencies", ["currency_id"], :name => "website_currencies_currency_id_fk"
  add_index "website_currencies", ["website_id", "currency_id"], :name => "index_website_currencies_on_website_id_and_currency_id", :unique => true

  create_table "website_languages", :force => true do |t|
    t.integer  "website_id",                 :null => false
    t.integer  "language_id",                :null => false
    t.integer  "primary",     :default => 0, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "website_languages", ["language_id"], :name => "website_languages_language_id_fk"
  add_index "website_languages", ["website_id", "language_id"], :name => "index_website_languages_on_website_id_and_language_id", :unique => true

  create_table "websites", :force => true do |t|
    t.string   "name",       :limit => 128,                :null => false
    t.string   "code",       :limit => 128,                :null => false
    t.string   "about",      :limit => 128,                :null => false
    t.string   "domain",     :limit => 128,                :null => false
    t.integer  "primary",                   :default => 0, :null => false
    t.integer  "enabled",                   :default => 0, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "websites", ["code"], :name => "index_websites_on_code", :unique => true
  add_index "websites", ["name"], :name => "index_websites_on_name", :unique => true

  add_foreign_key "addresses", "address_types", :name => "addresses_address_type_id_fk"
  add_foreign_key "addresses", "countries", :name => "addresses_country_id_fk"
  add_foreign_key "addresses", "users", :name => "addresses_user_id_fk"

  add_foreign_key "admin_job_reports", "admin_jobs", :name => "admin_job_reports_admin_job_id_fk"

  add_foreign_key "agents", "products", :name => "agents_product_id_fk"
  add_foreign_key "agents", "users", :name => "agents_user_id_fk"

  add_foreign_key "alert_members", "alerts", :name => "alert_members_alert_id_fk"
  add_foreign_key "alert_members", "users", :name => "alert_members_user_id_fk"

  add_foreign_key "alerts", "alert_types", :name => "alerts_alert_type_id_fk"
  add_foreign_key "alerts", "alert_values", :name => "alerts_alert_value_id_fk"
  add_foreign_key "alerts", "users", :name => "alerts_user_id_fk"

  add_foreign_key "announcements", "announcement_statuses", :name => "announcements_announcement_status_id_fk"
  add_foreign_key "announcements", "products", :name => "announcements_author_id_fk", :column => "author_id"
  add_foreign_key "announcements", "products", :name => "announcements_product_id_fk"
  add_foreign_key "announcements", "users", :name => "announcements_user_id_fk"

  add_foreign_key "answers", "pollings", :name => "answers_polling_id_fk"

  add_foreign_key "articles", "article_types", :name => "articles_article_type_id_fk"
  add_foreign_key "articles", "websites", :name => "articles_website_id_fk"

  add_foreign_key "bookcases", "articles", :name => "bookcases_article_id_fk"
  add_foreign_key "bookcases", "products", :name => "bookcases_product_id_fk"

  add_foreign_key "callmebacks", "contact_statuses", :name => "callmebacks_contact_status_id_fk"
  add_foreign_key "callmebacks", "contact_types", :name => "callmebacks_contact_type_id_fk"
  add_foreign_key "callmebacks", "users", :name => "callmebacks_user_id_fk"
  add_foreign_key "callmebacks", "websites", :name => "callmebacks_website_id_fk"

  add_foreign_key "cart_items", "shopping_carts", :name => "cart_items_shopping_cart_id_fk"
  add_foreign_key "cart_items", "variants", :name => "cart_items_variant_id_fk"

  add_foreign_key "categories", "proposals", :name => "categories_proposal_id_fk"
  add_foreign_key "categories", "websites", :name => "categories_website_id_fk"

  add_foreign_key "comments", "comment_statuses", :name => "comments_comment_status_id_fk"
  add_foreign_key "comments", "comment_types", :name => "comments_comment_type_id_fk"
  add_foreign_key "comments", "products", :name => "comments_author_id_fk", :column => "author_id"
  add_foreign_key "comments", "products", :name => "comments_product_id_fk"
  add_foreign_key "comments", "users", :name => "comments_user_id_fk"

  add_foreign_key "comparator_items", "comparators", :name => "comparator_items_comparator_id_fk"
  add_foreign_key "comparator_items", "variants", :name => "comparator_items_variant_id_fk"

  add_foreign_key "comparators", "sessions", :name => "comparators_session_id_fk"
  add_foreign_key "comparators", "users", :name => "comparators_user_id_fk"
  add_foreign_key "comparators", "websites", :name => "comparators_website_id_fk"

  add_foreign_key "complaints", "complaint_statuses", :name => "complaints_complaint_status_id_fk"
  add_foreign_key "complaints", "complaint_types", :name => "complaints_complaint_type_id_fk"
  add_foreign_key "complaints", "users", :name => "complaints_user_id_fk"

  add_foreign_key "connections", "categories", :name => "connections_category_id_fk"
  add_foreign_key "connections", "products", :name => "connections_product_id_fk"

  add_foreign_key "contacts", "products", :name => "contacts_product_id_fk"

  add_foreign_key "contracts", "contract_types", :name => "contracts_contract_type_id_fk"

  add_foreign_key "favorite_products", "favorites", :name => "favorite_products_favorite_id_fk"
  add_foreign_key "favorite_products", "products", :name => "favorite_products_product_id_fk"

  add_foreign_key "favorites", "users", :name => "favorites_user_id_fk"

  add_foreign_key "feedbacks", "contact_statuses", :name => "feedbacks_contact_status_id_fk"
  add_foreign_key "feedbacks", "contact_types", :name => "feedbacks_contact_type_id_fk"
  add_foreign_key "feedbacks", "users", :name => "feedbacks_user_id_fk"
  add_foreign_key "feedbacks", "websites", :name => "feedbacks_website_id_fk"

  add_foreign_key "instructions", "patterns", :name => "instructions_pattern_id_fk"
  add_foreign_key "instructions", "products", :name => "instructions_product_id_fk"

  add_foreign_key "inventories", "storehouses", :name => "inventories_storehouse_id_fk"
  add_foreign_key "inventories", "variants", :name => "inventories_variant_id_fk"

  add_foreign_key "links", "products", :name => "links_expert_product_id_fk", :column => "expert_product_id"
  add_foreign_key "links", "products", :name => "links_product_id_fk"

  add_foreign_key "manpages", "websites", :name => "manpages_website_id_fk"

  add_foreign_key "opinions", "articles", :name => "opinions_article_id_fk"
  add_foreign_key "opinions", "opinion_statuses", :name => "opinions_opinion_status_id_fk"
  add_foreign_key "opinions", "users", :name => "opinions_user_id_fk"

  add_foreign_key "order_variant_properties", "order_variants", :name => "order_variant_properties_order_variant_id_fk"

  add_foreign_key "order_variants", "currencies", :name => "order_variants_currency_id_fk"
  add_foreign_key "order_variants", "orders", :name => "order_variants_order_id_fk"
  add_foreign_key "order_variants", "variants", :name => "order_variants_variant_id_fk"

  add_foreign_key "orders", "addresses", :name => "orders_address_id_fk"
  add_foreign_key "orders", "checkout_states", :name => "orders_checkout_state_id_fk"
  add_foreign_key "orders", "order_states", :name => "orders_order_state_id_fk"
  add_foreign_key "orders", "payment_types", :name => "orders_payment_type_id_fk"
  add_foreign_key "orders", "regions", :name => "orders_region_id_fk"
  add_foreign_key "orders", "sessions", :name => "orders_session_id_fk"
  add_foreign_key "orders", "shipping_types", :name => "orders_shipping_type_id_fk"
  add_foreign_key "orders", "users", :name => "orders_user_id_fk"
  add_foreign_key "orders", "websites", :name => "orders_website_id_fk"

  add_foreign_key "patterns", "pattern_types", :name => "patterns_pattern_type_id_fk"
  add_foreign_key "patterns", "websites", :name => "patterns_website_id_fk"

  add_foreign_key "photos", "products", :name => "photos_product_id_fk"

  add_foreign_key "pollings", "products", :name => "pollings_product_id_fk"
  add_foreign_key "pollings", "users", :name => "pollings_user_id_fk"

  add_foreign_key "presentations", "websites", :name => "presentations_website_id_fk"

  add_foreign_key "privacies", "privacy_types", :name => "privacies_privacy_type_id_fk"
  add_foreign_key "privacies", "privacy_values", :name => "privacies_privacy_value_id_fk"
  add_foreign_key "privacies", "users", :name => "privacies_user_id_fk"

  add_foreign_key "privacy_members", "privacies", :name => "privacy_members_privacy_id_fk"
  add_foreign_key "privacy_members", "users", :name => "privacy_members_user_id_fk"

  add_foreign_key "product_type_properties", "product_types", :name => "product_type_properties_product_type_id_fk"
  add_foreign_key "product_type_properties", "properties", :name => "product_type_properties_property_id_fk"

  add_foreign_key "product_types", "proposals", :name => "product_types_proposal_id_fk"
  add_foreign_key "product_types", "websites", :name => "product_types_website_id_fk"

  add_foreign_key "products", "presentations", :name => "products_presentation_id_fk"
  add_foreign_key "products", "product_types", :name => "products_product_type_id_fk"
  add_foreign_key "products", "proposals", :name => "products_proposal_id_fk"
  add_foreign_key "products", "view_types", :name => "products_view_type_id_fk"
  add_foreign_key "products", "websites", :name => "products_website_id_fk"

  add_foreign_key "promoitems", "products", :name => "promoitems_product_id_fk"
  add_foreign_key "promoitems", "promotions", :name => "promoitems_promotion_id_fk"

  add_foreign_key "promotion_calculators", "promotions", :name => "promotion_calculators_promotion_id_fk"

  add_foreign_key "promotion_functors", "promotions", :name => "promotion_functors_promotion_id_fk"

  add_foreign_key "promotions", "promotion_types", :name => "promotions_promotion_type_id_fk"
  add_foreign_key "promotions", "websites", :name => "promotions_website_id_fk"

  add_foreign_key "properties", "datatypes", :name => "properties_datatype_id_fk"
  add_foreign_key "properties", "websites", :name => "properties_website_id_fk"

  add_foreign_key "proposals", "websites", :name => "proposals_website_id_fk"

  add_foreign_key "regions", "websites", :name => "regions_website_id_fk"

  add_foreign_key "requests", "products", :name => "requests_author_id_fk", :column => "author_id"
  add_foreign_key "requests", "products", :name => "requests_product_id_fk"
  add_foreign_key "requests", "request_statuses", :name => "requests_request_status_id_fk"
  add_foreign_key "requests", "requests", :name => "requests_parent_id_fk", :column => "parent_id"
  add_foreign_key "requests", "users", :name => "requests_user_id_fk"

  add_foreign_key "respondents", "pollings", :name => "respondents_polling_id_fk"

  add_foreign_key "runtime_settings", "websites", :name => "runtime_settings_website_id_fk"

  add_foreign_key "schedules", "timetables", :name => "schedules_timetable_id_fk"

  add_foreign_key "settings", "options", :name => "settings_option_id_fk"
  add_foreign_key "settings", "users", :name => "settings_user_id_fk"

  add_foreign_key "shopping_carts", "sessions", :name => "shopping_carts_session_id_fk"
  add_foreign_key "shopping_carts", "users", :name => "shopping_carts_user_id_fk"
  add_foreign_key "shopping_carts", "websites", :name => "shopping_carts_website_id_fk"

  add_foreign_key "static_contents", "change_freqs", :name => "static_contents_change_freq_id_fk"
  add_foreign_key "static_contents", "websites", :name => "static_contents_website_id_fk"

  add_foreign_key "storehouses", "regions", :name => "storehouses_region_id_fk"
  add_foreign_key "storehouses", "websites", :name => "storehouses_website_id_fk"

  add_foreign_key "tag_articles", "articles", :name => "tag_articles_article_id_fk"
  add_foreign_key "tag_articles", "tags", :name => "tag_articles_tag_id_fk"

  add_foreign_key "tag_products", "products", :name => "tag_products_product_id_fk"
  add_foreign_key "tag_products", "tags", :name => "tag_products_tag_id_fk"

  add_foreign_key "themes", "websites", :name => "themes_website_id_fk"

  add_foreign_key "timetables", "products", :name => "timetables_product_id_fk"
  add_foreign_key "timetables", "timetable_statuses", :name => "timetables_timetable_status_id_fk"
  add_foreign_key "timetables", "users", :name => "timetables_user_id_fk"

  add_foreign_key "user_roles", "roles", :name => "user_roles_role_id_fk"
  add_foreign_key "user_roles", "users", :name => "user_roles_user_id_fk"

  add_foreign_key "user_tags", "tags", :name => "user_tags_tag_id_fk"
  add_foreign_key "user_tags", "users", :name => "user_tags_user_id_fk"

  add_foreign_key "users", "user_statuses", :name => "users_user_status_id_fk"
  add_foreign_key "users", "websites", :name => "users_website_id_fk"

  add_foreign_key "vacancies", "regions", :name => "vacancies_region_id_fk"
  add_foreign_key "vacancies", "websites", :name => "vacancies_website_id_fk"

  add_foreign_key "variant_properties", "properties", :name => "variant_properties_property_id_fk"
  add_foreign_key "variant_properties", "variants", :name => "variant_properties_variant_id_fk"

  add_foreign_key "variants", "currencies", :name => "variants_currency_id_fk"
  add_foreign_key "variants", "products", :name => "variants_product_id_fk"

  add_foreign_key "view_type_items", "view_types", :name => "view_type_items_view_type_id_fk"
  add_foreign_key "view_type_items", "views", :name => "view_type_items_view_id_fk"

  add_foreign_key "view_types", "websites", :name => "view_types_website_id_fk"

  add_foreign_key "views", "websites", :name => "views_website_id_fk"

  add_foreign_key "website_currencies", "currencies", :name => "website_currencies_currency_id_fk"
  add_foreign_key "website_currencies", "websites", :name => "website_currencies_website_id_fk"

  add_foreign_key "website_languages", "languages", :name => "website_languages_language_id_fk"
  add_foreign_key "website_languages", "websites", :name => "website_languages_website_id_fk"

end
