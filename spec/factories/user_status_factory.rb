# ::Rails.logger.error("...")

Factory.define(:user_status) do |f|
  f.sequence(:name) { |n| "user_status#{n}" }
  f.sequence(:code) { |n| "user_status#{n}" }
  f.sequence(:about) { |n| "user_status#{n}" }
end
