class VacancyFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :namel, :string
  column :region_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :region

  #
  # Methods to create sql filter for centers
  def conditions
    sqlwhere = "1 = 1 "
    sqlwhere = sqlwhere + "and vacancies.region_id = ? " if is_object_here?(region_id)
    sqlwhere = sqlwhere + "and vacancies.namel like ? " if is_string_here?(namel)
    sqlwhere = sqlwhere + "and vacancies.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and vacancies.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere]
    result << region_id if is_object_here?(region_id)
    result << UnicodeUtils.downcase(namel) if is_string_here?(namel)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

  #
  # Methods to create sql filter for centers
  def self.enabled_vacancies
    ["    vacancies.enabled = 1"]
  end

end
