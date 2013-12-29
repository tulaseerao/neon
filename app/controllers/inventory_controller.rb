class InventoryController < ApplicationController
  def index
  end
  
  def import
    Processheet.process_all(params[:file])
   redirect_to root_path, notice: "Inventory imported."
  end
end
