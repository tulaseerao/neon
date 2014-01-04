class AvDevicesController < ApplicationController
  before_action :set_av_device, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /av_devices
  # GET /av_devices.json
  def index
    @av_devices = AvDevice.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
  end

  # GET /av_devices/1
  # GET /av_devices/1.json
  def show
  end
  
  def import
    AvDevice.import(params[:file])
    redirect_to av_devices_path, notice: 'AV devices were successfully created.'
  end
  
  # GET /av_devices/new
  def new
    @av_device = AvDevice.new
  end

  # GET /av_devices/1/edit
  def edit
  end

  # POST /av_devices
  # POST /av_devices.json
  def create
    @av_device = AvDevice.new(av_device_params)

    respond_to do |format|
      if @av_device.save
        format.html { redirect_to @av_device, notice: 'Av device was successfully created.' }
        format.json { render action: 'show', status: :created, location: @av_device }
      else
        format.html { render action: 'new' }
        format.json { render json: @av_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /av_devices/1
  # PATCH/PUT /av_devices/1.json
  def update
    respond_to do |format|
      if @av_device.update(av_device_params)
        format.html { redirect_to @av_device, notice: 'Av device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @av_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /av_devices/1
  # DELETE /av_devices/1.json
  def destroy
    @av_device.destroy
    respond_to do |format|
      format.html { redirect_to av_devices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_av_device
      @av_device = AvDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def av_device_params
      params.require(:av_device).permit(:status, :asset_tag, :device, :location, :brand, :model, :serial_number, :value, :lease, :lease_term, :owner_or_teacher, :notes)
    end
    
    def sort_column
      AvDevice.column_names.include?(params[:sort]) ? params[:sort] : "brand"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
