class PeriodChannel < ApplicationCable::Channel
  def subscribed
  	@restrict =ActionCable.server.connections.size.to_i
	if @restrict <=2
  	stream_from "period_channel"
	else
		reject_unauthorized_connection
	end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
