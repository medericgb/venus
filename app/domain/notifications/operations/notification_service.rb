class NotificationService
  def self.send_notification(inbox_file, message)
    File.open(inbox_file, 'a') do |file|
      file.puts message
    end
  end
end
