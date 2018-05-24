class AddDataToVendors < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :total_account, :bigint
    add_column :vendors, :number_of_sales, :integer, default: 0
  end
end
