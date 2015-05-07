json.data do
  json.partial! "show", collection: @orders, :as => :p
end
