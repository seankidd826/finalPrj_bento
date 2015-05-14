class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_menu

  def create
    liked = @menu.find_like_by_user(current_user)

    unless liked
      @like = Like.create(:user => current_user, :menu => @menu)
    end

    respond_to do |format|
      # format.html {redirect_to :back}
      format.js {
        @menu.reload
        render :template => "likes/ajax"
      }
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy
    @like = nil

    respond_to do |format|
      # format.html {redirect_to :back}
      format.js {
        @menu.reload
        render :template => "likes/ajax"
      }
    end
  end



  private

  def likes_param
    params.require(:like).permit(:menu_id,:user_id,:user)
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end



end
