class PropertyFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :name, :string
  column :code, :string
  column :about, :string
  column :datatype_id, :integer
  column :created_at_since, :datetime
  column :created_at_till, :datetime

  belongs_to :datatype

  #
  def conditions(website)

    sqlwhere = "properties.website_id = ? "
    sqlwhere = sqlwhere + "and properties.name like ? " if is_string_here?(name)
    sqlwhere = sqlwhere + "and properties.datatype_id > ? " if is_object_here?(datatype_id)
    sqlwhere = sqlwhere + "and properties.created_at > ? " if is_object_here?(created_at_since)
    sqlwhere = sqlwhere + "and properties.created_at < ? " if is_object_here?(created_at_till)

    result = [sqlwhere, website.id]
    result << UnicodeUtils.downcase(name) if is_string_here?(name)
    result << datatype_id if is_object_here?(datatype_id)
    result << created_at_since if is_object_here?(created_at_since)
    result << created_at_till if is_object_here?(created_at_till)
    result
  end
end
