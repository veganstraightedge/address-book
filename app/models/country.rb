class Country < ActiveRecord::Base
  has_many :regions
  has_many :localities

  def slug
    abbreviation.downcase
  end
end
