require 'csv'

task :data_export => :environment do
  CSV.open("tmp/kudos_report.csv","w") do |csv|
    Kudo.all.each_with_index do |k,index|
      puts "done #{index}"
      csv << [k.giver.name, k.receivers, k.comments, k.created_at]
    end
    DataExportMailer.send_data_export.deliver_now
  end
end
