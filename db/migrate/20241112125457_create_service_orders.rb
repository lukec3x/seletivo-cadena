class CreateServiceOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :service_orders do |t|
      t.integer :status, null: false, default: 0
      t.string :client_name, null: false
      t.string :description
      t.datetime :completed_at
      t.references :employee, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
