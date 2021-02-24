class SettingsController < ApplicationController
  before_action :set_setting, only: %i[ show update destroy ]

  # GET /settings
  # GET /settings.json
  def index
    @settings = Setting.all
  end

  # GET /settings/1
  # GET /settings/1.json
  def show
  end

  # POST /settings
  # POST /settings.json
  def create
    @setting = Setting.new(setting_params)

    if @setting.save
      render :show, status: :created, location: @setting
    else
      render json: @setting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    if @setting.update(setting_params)
      render :show, status: :ok, location: @setting
    else
      render json: @setting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /settings/1
  # DELETE /settings/1.json
  def destroy
    @setting.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def setting_params
      params.require(:setting).permit(:openwather_key, :twitter_api_key, :lang, :metric)
    end
end
