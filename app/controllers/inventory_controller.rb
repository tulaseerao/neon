class InventoryController < ApplicationController
  
  def index
    
  end
  
  def import
   Inventory.import(params[:file])
   redirect_to inventory_path, notice: "Inventory imported."
  end

end
