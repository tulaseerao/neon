class AvInteractivesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /av_interactives
  # GET /av_interactives.json
  def index
    @devices = AvInteractive.all
  end

  # GET /av_interactives/1
  # GET /av_interactives/1.json
  def show
  end
  
  # GET /av_interactives/new
  def new
    @device = AvInteractive.new
  end

  # GET /av_interactives/1/edit
  def edit
  end

  # POST /av_interactives
  # POST /av_interactives.json
  def create
    @device = AvInteractive.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render action: 'show', status: :created, location: @device }
      else
        format.html { render action: 'new' }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /av_interactives/1
  # PATCH/PUT /av_interactives/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /av_interactives/1
  # DELETE /av_interactives/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to av_interactives_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = AvInteractive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:brand, :device_type, :location, :model, :asset_tag, :serial_no, :status, :value, :lease, :lease_term, :owner, :notes)
    end
end
