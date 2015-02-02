class Country < ActiveRecord::Base
  has_many :regions

  def slug
    abbreviation.downcase
  end
end
