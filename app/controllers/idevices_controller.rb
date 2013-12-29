class IdevicesController < ApplicationController
  before_action :set_idevice, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  # GET /idevices
  # GET /idevices.json
  def index
    # @idevices = Idevice.paginate(page: params[:page], per_page: 10)
    @idevices = Idevice.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
  end

  # GET /idevices/1
  # GET /idevices/1.json
  def show
  end
  
  def import
    Idevice.import(params[:file])
    redirect_to idevices_path, notice: 'iDevices were successfully created.'
  end

  # GET /idevices/new
  def new
    @idevice = Idevice.new
  end

  # GET /idevices/1/edit
  def edit
  end

  # POST /idevices
  # POST /idevices.json
  def create
    @idevice = Idevice.new(idevice_params)

    respond_to do |format|
      if @idevice.save
        format.html { redirect_to @idevice, notice: 'Idevice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @idevice }
      else
        format.html { render action: 'new' }
        format.json { render json: @idevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idevices/1
  # PATCH/PUT /idevices/1.json
  def update
    respond_to do |format|
      if @idevice.update(idevice_params)
        format.html { redirect_to @idevice, notice: 'Idevice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @idevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idevices/1
  # DELETE /idevices/1.json
  def destroy
    @idevice.destroy
    respond_to do |format|
      format.html { redirect_to idevices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_idevice
    @idevice = Idevice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def idevice_params
    params.require(:idevice).permit(:device_type, :model_number, :capacity_hd, :serial_number, :asset_tag, :name)
  end
  def sort_column
    Idevice.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
