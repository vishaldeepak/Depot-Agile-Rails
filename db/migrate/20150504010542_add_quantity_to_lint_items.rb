class AddQuantityToLintItems < ActiveRecord::Migration
  def change
    add_column :lint_items, :quantity, :integer, default: 1
  end
end
