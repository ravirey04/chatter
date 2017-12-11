class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    $rooms = Room.all
  end


  def show
    @random_number = rand(0...10_000)
    response = RestClient.put "https://ravirey04:4b49a0f8-ad9a-11e7-a387-084a2cfd4227@global.xirsys.net/_turn/railswebrtc", accept: :json
    @json_response = response.to_json
  end


  def new
    $room = Room.new
  end


  def create
    $room = Room.new(room_params)

    respond_to do |format|
      if $room.save
        format.html { redirect_to $room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: $room }
      else
        format.html { render :new }
        format.json { render json: $room.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    $room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
   def sessions
      head :no_content
      ActionCable.server.broadcast "dummy_channel_#{$room.roomname}", params
     # Rails.logger.debug "qwertyyuuu:#{$room.roomname}"
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      $room = Room.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:roomname)
    end
end
