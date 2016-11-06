class DataExportMailer < ApplicationMailer

  def send_data_export(file)
    attachments['kudos_report'] = File.read('tmp/kudos_report.csv')
    mail( to: 'mikevallano@gmail.com', from: 'test@tester.com', :subject => "Report", attachment: file )
  end

end
