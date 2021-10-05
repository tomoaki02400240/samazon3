class CreateShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      t.references :user, foreign_key: true
      t.boolean :buy_flag, null: false, default: false
      t.timestamps
    end
  end
end
