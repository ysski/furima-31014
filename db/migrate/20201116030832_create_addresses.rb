class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase,       foreign_key: true
      t.string     :postcode,       null: false
      t.string     :city,           null: false
      t.string     :street,         null: false
      t.string     :building_name,  null: false
      t.string     :phone_number,   null: false
      t.integer    :prefecture_id,  null: false
      t.timestamps
    end
  end
end
