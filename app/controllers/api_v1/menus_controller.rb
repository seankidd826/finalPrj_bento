class ApiV1::MenusController < ApiController

  def show
    @menu = Menu.last
  end

end