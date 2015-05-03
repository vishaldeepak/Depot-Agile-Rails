=begin
The concerns directory is where you place code that can be shared between controllers. 
By the time you complete part 2, the CurrentCart module will
 be included by the LineItemsController, OrderController, and StoreController.
Whenever you use the scaffold generator, it will fully populate 6 methods for you. 
Rails doesn’t “know” that this is a shopping cart, it merely understands that it is a 
resource that has many LineItems. The “shopping-cartness” is what you add by tailoring the generated files.
rescue Exception => e	
=end
module CurrentCart
	extend ActiveSupport::Concern

	private

	def set_cart
		@cart= Cart.find(session[:card_id])
	rescue ActiveRecord::RecordNotFound
		@cart= Cart.create
		session[:card_id]=@cart.id
	end
end