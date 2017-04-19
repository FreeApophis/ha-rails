class LightGroupsController < ApplicationController
  before_action :set_light_group, only: [:show, :edit, :update, :destroy, :on, :off]

  def index
    @light_groups = LightGroup.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @light_group.update(light_group_params)
        format.html { redirect_to @light_group, notice: 'light_group was successfully updated.' }
        format.json { render :show, status: :ok, location: @light_group }
      else
        format.html { render :edit }
        format.json { render json: @light_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def on
    @light_group.on!

    respond_to do |format|
      format.json { render json: {ok: true} }
    end    
  end

  def off
    @light_group.off!

    respond_to do |format|
      format.json { render json: {ok: true} }
    end    
  end

  private
    def set_light_group
      @light_group = LightGroup.find(params[:id])
    end

    def light_group_params
      params.fetch(:light_group, {})
    end
end
