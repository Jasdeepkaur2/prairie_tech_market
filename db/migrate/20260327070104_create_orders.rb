class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true
      t.datetime :order_date
      t.decimal :total_amount, precision: 10, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
