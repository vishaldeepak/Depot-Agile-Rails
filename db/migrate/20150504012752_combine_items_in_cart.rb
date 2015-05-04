class CombineItemsInCart < ActiveRecord::Migration
  def up
  	Cart.all.each do |cart|
  		sums = cart.lint_items.group(:product_id).sum(:quantity)

  		sums.each do |product_id,quantity|
  			if quantity> 1
  				cart.lint_items.where(product_id: product_id).delete_all
  				item = cart.lint_items.build(product_id: product_id)
  				item.quantity = quantity
  				item.save!
  			end
  		end
  	end
  end

  def down#For rollback if ever wanted
  	LintItem.where("quantity>1").each do |lint_item|
  		lint_item.quantity.times do  
  			LintItem.create cart_id: lint_item.cart_id,
  			product_id: lint_item.product_id, quantity: 1
  		end
  	end
  end
end
