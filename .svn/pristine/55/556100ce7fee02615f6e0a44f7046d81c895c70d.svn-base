class RuntimeSettingFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :name, :string
  column :code, :string
  column :about, :string
  column :value, :string
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  #
  # Methods to create sql filter for centers
  def conditions
    sqlwhere = ""
    sqlwhere = sqlwhere + "    runtime_settings.name like ? " if is_string_here?(name)
    sqlwhere = sqlwhere + "and runtime_settings.code like ? " if is_string_here?(code)
    sqlwhere = sqlwhere + "and runtime_settings.about like ? " if is_string_here?(about)
    sqlwhere = sqlwhere + "and runtime_settings.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and runtime_settings.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere]
    result << name if is_string_here?(name)
    result << code if is_string_here?(code)
    result << about if is_string_here?(about)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

end
