class ApiV1::MenusController < ApiController
  def index
    @menus = Menu.all
  end
end