require 'rails_helper'

RSpec.describe "API_V1::Menus", :type => :request do

  before do
    @menu = Menu.create!( :title => "Foo", :contents => "肉絲炒蛋呱瓜瓜瓜殺殺殺殺幾嘰嘰唧唧唧水果",
                        :price => 123, :in_stock_qty => 10, :mominfo => "台北 李媽媽" )
    @menu.reload
  end

  example "GET /api/v1/menus/latest" do
    get "/api/v1/menus/latest"

    expect(response).to have_http_status(200)
    expect(response.body).to eq(
      { "id"=> @menu.id,
        "url"=>"http://www.example.com/api/v1/menus/#{@menu.id}",
        "img_url"=>"http://www.example.com/images/original/missing.png",
        "title"=>"Foo",
        "contents"=>["肉絲炒蛋", "呱瓜瓜瓜", "殺殺殺殺", "幾嘰嘰", "唧唧唧", "水果"],
        "price" => 123,
        "in_stock_qty"=>10,
        "mominfo"=>["台北", " 李媽媽"],
        "created_at"=> @menu.created_at,
        "updated_at"=> @menu.updated_at
      }.to_json
    )
  end

end
