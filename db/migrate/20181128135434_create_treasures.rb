class CreateTreasures < ActiveRecord::Migration[5.2]
  def change
    create_table :treasures do |t|

      t.timestamps
    end
  end
end
