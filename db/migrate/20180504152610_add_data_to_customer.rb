class AddDataToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :total_account, :bigint
    add_column :customers, :number_of_buys, :integer, default: 0
  end
end
