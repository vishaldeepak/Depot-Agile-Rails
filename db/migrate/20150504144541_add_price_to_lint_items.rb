class AddPriceToLintItems < ActiveRecord::Migration
  def up
    add_column :lint_items, :price, :decimal, precision: 8, scale: 2

    LintItem.all.each do |lint_item|
    		lint_item.update_attribute :price, lint_item.product.price
    end
  end

  def down
  	remove_column :lint_items, :price
  end
end
