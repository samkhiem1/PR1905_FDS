require "csv"
namespace :db do
  desc "import master data form file in db/seeds  folder"
  task import_master_data: :environment do
    csv_text = File.read(Rails.root.join('db', 'seeds', 'm_series_number.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    M::SerialNumber.delete_all
    csv.each do |row|
      m = M::SerialNumber.new
      m.serial_number = row['serial_number']
      m.save
      puts "#{m.serial_number} saved"
    end
  end
end
