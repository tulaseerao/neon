class PrintersController < ApplicationController
  before_action :set_printer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /printers
  # GET /printers.json
  def index
    @printers  = Printer.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
  end

  # GET /printers/1
  # GET /printers/1.json
  def show
  end
  
  def import
    Printer.import(params[:file])
    redirect_to printers_path, notice: 'Printers were successfully created.'
  end

  # GET /printers/new
  def new
    @printer = Printer.new
  end

  # GET /printers/1/edit
  def edit
  end

  # POST /printers
  # POST /printers.json
  def create
    @printer = Printer.new(printer_params)

    respond_to do |format|
      if @printer.save
        format.html { redirect_to @printer, notice: 'Printer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @printer }
      else
        format.html { render action: 'new' }
        format.json { render json: @printer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /printers/1
  # PATCH/PUT /printers/1.json
  def update
    respond_to do |format|
      if @printer.update(printer_params)
        format.html { redirect_to @printer, notice: 'Printer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @printer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /printers/1
  # DELETE /printers/1.json
  def destroy
    @printer.destroy
    respond_to do |format|
      format.html { redirect_to printers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_printer
      @printer = Printer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def printer_params
      params.require(:printer).permit(:printer, :location, :host_server, :ip_address, :win_7, :win_xp, :asset_tag, :serial_number, :comment)
    end
    
    def sort_column
      Printer.column_names.include?(params[:sort]) ? params[:sort] : "printer"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
