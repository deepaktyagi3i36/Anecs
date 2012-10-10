# ::Rails.logger.error("...")
Factory.define(:user) do |f|
  f.user_status { UserStatus.find_by_name("active") }
  f.nickname { Faker::Internet.user_name }
  f.firstname { Faker::Internet.user_name }
  f.middlename { Faker::Internet.user_name }
  f.lastname { Faker::Internet.user_name }
  f.email { Faker::Internet.email }
  f.login { Faker::Internet.user_name }
  f.password "majoron123"
  f.password_confirmation "majoron123"
  f.active true
end


Factory.define(:admin_user, :parent => :user) do |u|
  u.after_create do |admin_user|
    Factory(:user_role, :user => admin_user, :role =>  Role.find_by_name("admin"))
  end
end

Factory.define(:moderator_user, :parent => :user) do |u|
  u.after_create do |moderator_user|
    Factory(:user_role, :user => moderator_user, :role =>  Role.find_by_name("moderator"))
  end
end

Factory.define(:hrmanager_user, :parent => :user) do |u|
  u.after_create do |hrmanager_user|
    Factory(:user_role, :user => hrmanager_user, :role =>  Role.find_by_name("hrmanager"))
  end
end

