class ImportWeaponsCsv < ActiveRecord::Migration[5.1]
  def change
    require 'csv'

      csv_text = File.read('db/weapons.csv').force_encoding("UTF-8")
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        Weapon.create!(row.to_hash)
      end
  end
end
