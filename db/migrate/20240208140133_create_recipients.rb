class CreateRecipients < ActiveRecord::Migration[7.1]
  
  def change
      create_table :recipients, id: false do |t|
        t.references :private_message, foreign_key: true
        t.references :user, foreign_key: true
      end
  end
end
