json.data do
  json.partial! "show", collection: @menus, :as => :p
end
