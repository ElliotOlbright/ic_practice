class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.boolean :open
      t.integer :thrill

      t.timestamps
    end
  end
end
