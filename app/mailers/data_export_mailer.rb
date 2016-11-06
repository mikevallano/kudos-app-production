class DataExportMailer < ApplicationMailer

  def send_data_export
    attachments['kudos_report.csv'] = File.read('tmp/kudos_report.csv')
    mail( to: 'test@tester.com', from: 'test@tester.com', :subject => "Report" )
  end

end
