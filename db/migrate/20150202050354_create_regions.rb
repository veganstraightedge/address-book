class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :name, :abbreviation, :slug
      t.references :country

      t.timestamps null: false
    end

    usa    = Country.find_by(name: "United States")
    canada = Country.find_by(name: "Canada")

    states = {
      AL: "Alabama",
      AK: "Alaska",
      AZ: "Arizona",
      AR: "Arkansas",
      CA: "California",
      CO: "Colorado",
      CT: "Connecticut",
      DE: "Delaware",
      DC: "District Of Columbia",
      FL: "Florida",
      GA: "Georgia",
      HI: "Hawaii",
      ID: "Idaho",
      IL: "Illinois",
      IN: "Indiana",
      IA: "Iowa",
      KS: "Kansas",
      KY: "Kentucky",
      LA: "Louisiana",
      ME: "Maine",
      MD: "Maryland",
      MA: "Massachusetts",
      MI: "Michigan",
      MN: "Minnesota",
      MS: "Mississippi",
      MO: "Missouri",
      MT: "Montana",
      NE: "Nebraska",
      NV: "Nevada",
      NH: "New Hampshire",
      NJ: "New Jersey",
      NM: "New Mexico",
      NY: "New York",
      NC: "North Carolina",
      ND: "North Dakota",
      OH: "Ohio",
      OK: "Oklahoma",
      OR: "Oregon",
      PA: "Pennsylvania",
      RI: "Rhode Island",
      SC: "South Carolina",
      SD: "South Dakota",
      TN: "Tennessee",
      TX: "Texas",
      UT: "Utah",
      VT: "Vermont",
      VA: "Virginia",
      WA: "Washington",
      WV: "West Virginia",
      WI: "Wisconsin",
      WY: "Wyoming",
    }

    states.each do |abbreviation, name|
      Region.create!(name: name, abbreviation: abbreviation, country: usa)
    end

    provinces = {
      BC: "British Columbia",
      ON: "Ontario",
      NF: "Newfoundland",
      NS: "Nova Scotia",
      PE: "Prince Edward Island",
      NB: "New Brunswick",
      QC: "Quebec",
      MB: "Manitoba",
      SK: "Saskatchewan",
      AB: "Alberta",
      NT: "Northwest Territories",
      YT: "Yukon Territory"
    }

    provinces.each do |abbreviation, name|
      Region.create!(name: name, abbreviation: abbreviation, country: canada)
    end
  end

  def self.down
    drop_table :regions
  end
end
