class LightsController < ApplicationController
  before_action :set_light, only: [:show, :edit, :update, :destroy, :on, :off]

  def index
    @lights = Light.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @light.update(light_params)
        format.html { redirect_to @light, notice: 'Light was successfully updated.' }
        format.json { render :show, status: :ok, location: @light }
      else
        format.html { render :edit }
        format.json { render json: @light.errors, status: :unprocessable_entity }
      end
    end
  end

  def on
    @light.on!

    respond_to do |format|
      format.json { render json: {ok: true} }
    end    
  end

  def off
    @light.off!

    respond_to do |format|
      format.json { render json: {ok: true} }
    end    
  end

  private
    def set_light
      @light = Light.find(params[:id])
    end

    def light_params
      params.fetch(:light, {})
    end
end
