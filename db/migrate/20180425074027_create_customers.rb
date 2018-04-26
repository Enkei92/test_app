class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :city
      t.integer :age
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
