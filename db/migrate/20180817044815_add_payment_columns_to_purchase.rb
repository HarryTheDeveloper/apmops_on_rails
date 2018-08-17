class AddPaymentColumnsToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :payer_id, :string
    add_column :purchases, :payment_id, :string
    add_column :purchases, :payment_token, :string
  end
end
