class CreateLocalities < ActiveRecord::Migration
  def self.up
    create_table :localities do |t|
      t.string     :name, :abbreviation, :slug
      t.references :region, :country

      t.timestamps null: false
    end

    usa = Country.find_by(name: "United States")
    Locality.create!(name: "Los Angeles",   abbreviation: "LA",   region: Region.find_by(abbreviation: "CA"), country: usa)
    Locality.create!(name: "San Francisco", abbreviation: "SF",   region: Region.find_by(abbreviation: "CA"), country: usa)
    Locality.create!(name: "New Orleans",   abbreviation: "NOLA", region: Region.find_by(abbreviation: "LA"), country: usa)
    Locality.create!(name: "Portland",      abbreviation: "PDX",  region: Region.find_by(abbreviation: "OR"), country: usa)
  end

  def self.down
    drop_table :localities
  end
end
