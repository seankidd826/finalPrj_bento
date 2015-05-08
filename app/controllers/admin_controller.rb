class AdminController < ApplicationController
  admin_config = YAML.load(File.read("#{Rails.root}/config/admin.yml"))[Rails.env]
  if Rails.env.development?
    http_basic_authenticate_with(
      # name: '12345', password: '12345'
      name: admin_config["name"],
      password: admin_config["passwords"]
    )
  end

  if Rails.env.production?
    http_basic_authenticate_with(
      name: admin_config["name"],
      password: admin_config["passwords"]
    )
  end
  layout 'admin'
end