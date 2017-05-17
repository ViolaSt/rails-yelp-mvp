class ChangePhoneNumberInRestaurants < ActiveRecord::Migration[5.1]
  def up
    change_column :restaurants, :phone_number, :string
  end

  def down
    change_column :restaurants, :phone_number, :integer
  end
end
