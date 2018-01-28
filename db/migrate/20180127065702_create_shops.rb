class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.string :owner_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :state
      t.string :city
      t.string :postcode
      t.float :latitude
      t.float :longitude
      t.string :password_digest
      t.timestamps
    end
  end
end
