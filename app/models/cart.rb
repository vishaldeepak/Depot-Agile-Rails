class Cart < ActiveRecord::Base
	has_many :lint_items, dependent: :destroy
end
