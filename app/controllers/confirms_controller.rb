class ConfirmsController < ApplicationController

  def confirm

  end



  private
  def confirm_params
    params.require(:confirm).permit(:confirm_name,:confirm_phone,:confirm_address,:confirm_menu_count,:confirm_total_price)
  end


end
