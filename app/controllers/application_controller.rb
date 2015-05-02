class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :date_Time_Load


  def date_Time_Load
  	@date=Time.now.strftime("%F ")
  	@time=Time.now.strftime("%H:%M:%S")
  end
end
