class AddStatusToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :status, :string, default: 'no_letters'
  end
end
