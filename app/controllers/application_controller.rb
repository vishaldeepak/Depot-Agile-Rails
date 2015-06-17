class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :date_Time_Load
  before_action :authorize


  def date_Time_Load
  	@date=Time.now.strftime("%F ")
  	@time=Time.now.strftime("%H:%M:%S")
  end

  protected

  	def authorize
  		unless User.find_by(id: session[:user_id])
  			redirect_to login_url, notice: "Please log in"
  		end
  	end
end
