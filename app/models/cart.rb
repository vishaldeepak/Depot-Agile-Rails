class Cart < ActiveRecord::Base
	has_many :lint_items, dependent: :destroy

	def add_product(product_id)
		current_item = lint_items.find_by(product_id: product_id)#find using the argument product_id using 
										# The one given as argument
		if current_item
			current_item.quantity += 1
		else
			product = Product.find(product_id) 
			current_item = lint_items.build(product_id: product_id,:price => product.price)
		end


		current_item
	end

	def total_price
		lint_items.to_a.sum { |item| item.total_price}
	end


end
