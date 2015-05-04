# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
$('#mymodal').html("<%= j(render :partial => "confirm",:locals => {:menu => @menu,:order => @order})%>")
:data=>{:confirm=>"確定要刪除?"}

1. 填表單 new action

<%= form_for @order %>

  <%= f.text_field :nanem

  <%= f.submit

2. 確認頁 confirm action
  def
    @order = Order.new( order_params)
  end

<%= form_for @order %>

  <%= @order.name
  <%= f.hidden_field :name %>

  <%= f.submit


3. create action

<%= if Rails.env.production? %>
    <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
    ga('create', 'UA-62568825-1', 'auto');
    ga('send', 'pageview');
    </script>
    <% end %>


