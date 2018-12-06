class Admin::DashboardController < ApplicationController
  before_filter :authorize
  http_basic_authenticate_with name: ENV["ADMINNAME"], password: ENV["ADMINPASSWORD"]

  def show
  end
end
