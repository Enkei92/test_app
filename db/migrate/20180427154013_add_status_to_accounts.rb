#Smells of reek:IrresponsibleModule
class AddStatusToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :status, :integer, default: 'no_letters'
  end
end
