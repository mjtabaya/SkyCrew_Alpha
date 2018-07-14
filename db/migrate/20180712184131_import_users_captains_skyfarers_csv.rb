class ImportUsersCaptainsSkyfarersCsv < ActiveRecord::Migration[5.1]
  def change
  end
#  def up
#    require 'csv'
#      csv_text = File.read('db/users.csv').force_encoding("UTF-8")
#      csv = CSV.parse(csv_text, :headers => true)
#      csv.each do |row|
#        User.create!(row.to_hash)
#    end

#    require 'csv'
#      csv_text = File.read('db/captains.csv').force_encoding("UTF-8")
#      csv = CSV.parse(csv_text, :headers => true)
#      csv.each do |row|
#        Captain.create!(row.to_hash)
#    end

#    require 'csv'
#      csv_text = File.read('db/skyfarers.csv').force_encoding("UTF-8")
#      csv = CSV.parse(csv_text, :headers => true)
#      csv.each do |row|
#        Skyfarer.create!(row.to_hash)
#    end
#  end

#  def down
#    Skyfarer.delete_all
#    Captain.delete_all
#  end
#end
