class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.integer :year
      t.references :ahbab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
