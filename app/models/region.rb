class Region < ActiveRecord::Base
  belongs_to :country
  before_create :set_slug
  before_update :set_slug

  def path
    "/countries/#{self.country.slug}/regions/#{name.downcase}"
  end

  def set_slug
    blank       = ""
    separator   = "-"
    self.slug ||= "#{name || content}"
    self.slug   = slug.downcase.
      gsub(/\(|\)|\[|\]\./, blank).
      gsub(/&amp;/,         blank).
      gsub(/\W+/,           separator).
      gsub(/_+/,            separator).
      gsub(/ +/,            separator).
      gsub(/-+/,            separator).
      gsub(/^-+/,           blank).
      gsub(/-+$/,           blank)
  end
end