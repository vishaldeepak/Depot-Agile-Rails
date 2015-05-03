class CreateLintItems < ActiveRecord::Migration
  def change
    create_table :lint_items do |t|
      t.references :product, index: true
      t.belongs_to :cart, index: true

      t.timestamps null: false
    end
    add_foreign_key :lint_items, :products
    add_foreign_key :lint_items, :carts
  end
end
