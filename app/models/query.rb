# == Schema Information
#
# Table name: tableless31_models
#
#  q :string
#

class Query < Tableless31Model
  # ::Rails.logger.error("...")

  column :q, :string

  validates_presence_of :q, :message => I18n.t('search.message.query_empty')
  validates_format_of :q, :with => /^[\w\s%\.,\-\?]*$/, :message => I18n.t('search.message.illegal_characters')
end
