#Smells of reek:IrresponsibleModule
class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
