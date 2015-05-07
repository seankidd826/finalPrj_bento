class AdminController < ApplicationController

  if Rails.env.development?
    http_basic_authenticate_with(
      name: '12345', password: '12345'
    )
  end

  if Rails.env.production?
    http_basic_authenticate_with(
      name: '', password: ''
    )
  end
  layout 'admin'
end