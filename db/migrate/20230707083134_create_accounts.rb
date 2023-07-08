class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :username, :unique => true
      t.string :email, :unique => true
      t.string :type
      t.string :password_digest
      t.string :recovery_password_digest

      t.timestamps
    end
  end
end
