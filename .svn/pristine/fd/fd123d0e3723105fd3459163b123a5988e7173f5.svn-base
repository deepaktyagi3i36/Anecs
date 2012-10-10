class ManpageFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :namel, :string
  column :code, :string
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  #
  # Methods to create sql filter for centers
  def conditions
    sqlwhere = "1 = 1 "
    sqlwhere = sqlwhere + "and manpages.code like ? " if is_string_here?(code)
    sqlwhere = sqlwhere + "and manpages.namel like ? " if is_string_here?(namel)
    sqlwhere = sqlwhere + "and manpages.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and manpages.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere]
    result << UnicodeUtils.downcase(code) if is_string_here?(code)
    result << UnicodeUtils.downcase(namel) if is_string_here?(namel)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end


  #
  # Methods to create sql
  def self.manpage_childs_conditions(parent)
    ["parent_id = ? and manpages.enabled = 1", parent.id]
  end

  # Methods to create sql
  def self.all_childs_conditions(parent)
    # Check that exist in current or sub categories
    ["manpages.treepath like ?", parent.treepath + "%"]
  end

  #
  # Methods to create sql
  def self.enabled_conditions
    ["manpages.enabled = 1"]
  end

end
