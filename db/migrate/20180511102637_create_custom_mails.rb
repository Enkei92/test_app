class CreateCustomMails < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_mails do |t|
      t.string :subject
      t.text :body
      t.boolean :enabled_by_admin, default: true

      t.timestamps
    end
  end
end
