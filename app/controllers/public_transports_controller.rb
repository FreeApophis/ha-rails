class PublicTransportsController < ApplicationController
  def show
    timetable = Transport::Timetable.new

    @board = timetable.board_for HA_CONF['public_transport']['station']
  end
end
