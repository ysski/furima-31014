class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.string :to
      t.string :ship

      t.timestamps
    end
  end
end
