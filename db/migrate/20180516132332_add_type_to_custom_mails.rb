class AddTypeToCustomMails < ActiveRecord::Migration[5.1]
  def change
    add_column :custom_mails, :mail_type, :integer
  end
end
