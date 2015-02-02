class Country < ActiveRecord::Base
  def slug
    abbreviation.downcase
  end
end
