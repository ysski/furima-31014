class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|

      t.timestamps
    end
  end
end
