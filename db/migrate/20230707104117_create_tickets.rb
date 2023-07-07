class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets, id: :uuid do |t|
      t.string :title
      t.string :content
      t.string :state, default: "open"
      t.references :client, null: false, foreign_key: { to_table: :accounts }, type: :uuid
      t.references :intervenant, null: false, foreign_key: { to_table: :accounts }, type: :uuid

      t.timestamps
    end
  end
end
