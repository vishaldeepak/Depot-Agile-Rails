class AddMorderToLintItem < ActiveRecord::Migration
  def change
    add_reference :lint_items, :morder, index: true
    add_foreign_key :lint_items, :morders
  end
end
