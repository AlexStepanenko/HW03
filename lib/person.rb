class Person
  attr_reader :name, :surname, :notification_list

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notification_list = []
  end

  def mark_as_read!
    notification_list.map! do |notification|
      notification.read = true
      notification
    end
  end

  def notifications
    notification_list.select { |notification| !notification.read }
  end

  def notify(message)
    notification = Notification.new(message: message)
    @notification_list.push(notification)
  end
end
