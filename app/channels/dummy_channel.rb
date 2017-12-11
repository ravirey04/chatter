class DummyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "dummy_channel_#{$room.roomname}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
