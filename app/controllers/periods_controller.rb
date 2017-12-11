class PeriodsController < ApplicationController
def create
    head :no_content
    ActionCable.server.broadcast "period_channel", params
 end
end
