require 'csv'

task :data_export => :environment do
  CSV.open("kudos_report.csv","w") do |csv|
    Kudo.all.each_with_index do |k,index|
      puts "done #{index}"
      csv << [k.giver.name, k.receivers, k.comments, k.created_at]
    end
  end
end
