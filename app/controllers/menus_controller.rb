class MenusController < ApplicationController
  # before_action :authenticate_user!, :only => [:update, :destroy]

  def index
    @menus = Menu.all
    @menu = Menu.all.last
    @order = Order.new
    @story = Story.last
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      flash[:success]="新增成功"
      redirect_to root_path
    else
      render :action => :new
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      flash[:notice]="編輯成功"
      redirect_to root_path
    else
      render :action => :edit
    end
  end



  private

  def menu_params
    params.require(:menu).permit(:mominfo, :title, :contents, :price, :in_stock_qty,:mompic, :momcontents, :momcontents_1, :momcontents_2, :momcontents_3 )
  end


end
