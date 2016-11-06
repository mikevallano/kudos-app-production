class DataExportMailer < ApplicationMailer

  def send_data_export
    attachments['kudos_report.csv'] = File.read('tmp/kudos_report.csv')
    mail( to: 'mikevallano@gmail.com', from: 'test@tester.com', :subject => "Report" )
  end

end
