class SendPushJob < ApplicationJob
  queue_as :default

  def perform(push_id)
    @push = Push.find push_id
    @push.send_to_devices
  end
end
