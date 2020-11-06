class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.text       :description,         null: false
      t.string     :name,                null: false
      t.integer    :category_id,         null: false
      t.integer    :condition_id,        null: false
      t.integer    :rprice,              null: false
      t.integer    :ship_from_id,        null: false
      t.integer    :days_to_ship_id,     null: false
      t.integer    :shipping_charges_id, null: false
      t.references :user,                foreign_key: true

    end
  end
end
