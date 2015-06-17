class AdminController < ApplicationController
  def index
  	@total_orders = Morder.count
  end
end
