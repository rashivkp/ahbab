class AddMobileToAhbab < ActiveRecord::Migration[6.1]
  def change
    add_column :ahbabs, :mobile, :string
  end
end
