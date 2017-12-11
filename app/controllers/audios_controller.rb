require 'rest-client'
require 'json'
class AudiosController < ApplicationController
  def home

    @random_number = rand(0...10_000)

    response = RestClient.put "https://ravirey04:4b49a0f8-ad9a-11e7-a387-084a2cfd4227@global.xirsys.net/_turn/railswebrtc", accept: :json
    @json_response = response.to_json

  end
end
