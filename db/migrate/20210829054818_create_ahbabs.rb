class CreateAhbabs < ActiveRecord::Migration[6.1]
  def change
    create_table :ahbabs do |t|
      t.string :name
      t.integer :amount
      t.string :address
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
