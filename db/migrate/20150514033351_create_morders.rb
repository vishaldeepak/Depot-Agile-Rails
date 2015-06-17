class CreateMorders < ActiveRecord::Migration
  def change
    create_table :morders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :pay_type

      t.timestamps null: false
    end
  end
end
