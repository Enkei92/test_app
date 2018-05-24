#Smells of reek:IrresponsibleModule
class AddDataToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :first_name, :string
    add_column :accounts, :last_name, :string
    add_column :accounts, :city, :string
    add_column :accounts, :age, :integer
    add_column :accounts, :role, :integer
  end
end
