# ::Rails.logger.error("...")

Factory.define(:role) do |f|
  f.sequence(:name) { |n| "role#{n}" }
  f.sequence(:code) { |n| "role#{n}" }
  f.sequence(:about) { |n| "role#{n}" }
end
