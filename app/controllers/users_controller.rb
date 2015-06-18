class UsersController < ApplicationController

  before_action :set_user, :only => [:edit, :update]

  def edit
  end

  def update
    # @user.update(user_params)
    if @user.update(user_params)
      flash[:notice] = "成功儲值"
      redirect_to user_orders_path(current_user)
    else
      flash[:alert] = "儲值失敗"
      render :action => :edit
    end
  end

  private

  def set_user
    @user = User.find_by_friendly_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:storage_money)
  end




end
