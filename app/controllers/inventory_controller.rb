class InventoryController < ApplicationController
  
  def index
    
  end
  
  def import
   Inventory.import(params[:file])
   redirect_to inventory_path, notice: "Devices imported."
  end

end
