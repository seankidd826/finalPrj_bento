class AdminController < ApplicationController

  admin_config = Rails.application.config_for(:admin)

  if Rails.env.development?
    http_basic_authenticate_with(
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