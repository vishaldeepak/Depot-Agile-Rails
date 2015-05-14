class Morder < ActiveRecord::Base
	PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
	has_many :lint_items, dependent: :destroy

	validates :name, :address, :email, presence: true
  	validates :pay_type, inclusion: PAYMENT_TYPES

    def add_lint_items_from_cart(cart)
   		cart.lint_items.each do |item|
      		item.cart_id = nil
      		lint_items << item
     	end
  	end
end
