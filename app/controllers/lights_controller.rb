class LightsController < ApplicationController
  before_action :set_light, only: [:show, :edit, :update, :destroy]

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

  private
    def set_light
      @light = Light.find(params[:id])
    end

    def light_params
      params.fetch(:light, {})
    end
end
