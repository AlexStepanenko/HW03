class Notification
  attr_accessor :message, :read

  def initialize(message:)
    @message = message
    @read = false
  end
end
