class DashboardsController < ApplicationController
  def show
    @switches = MyStromSwitch.all
  end
end
