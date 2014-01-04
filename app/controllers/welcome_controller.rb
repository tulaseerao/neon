class WelcomeController < ApplicationController
  
  def index
    if user_signed_in?
      redirect_to devices_path and return
    end
  end
end
