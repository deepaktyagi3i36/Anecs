class PatternFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :name, :string
  column :title, :string
  column :body, :string
  column :pattern_type_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :pattern_type


  #
  # Methods to create sql filter for experts
  def instruction_conditions
    sqlwhere = "
    exists (
      select
        1
      from
        pattern_types pattern_types
      where
            pattern_types.id = patterns.pattern_type_id
        and pattern_types.code = 'instructions'
    )";
    sqlwhere = sqlwhere + "and patterns.name like ? " if is_string_here?(name)
    sqlwhere = sqlwhere + "and patterns.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and patterns.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere]
    result << UnicodeUtils.downcase(name) if is_string_here?(name)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end

  #
  # Methods to create sql filter for experts
  def self.instruction_conditions
    sqlwhere = "
    exists (
      select
        1
      from
        pattern_types pattern_types
      where
            pattern_types.id = patterns.pattern_type_id
        and pattern_types.code = 'instructions'
    )";
    [sqlwhere]
  end

end
