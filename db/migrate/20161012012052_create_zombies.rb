class CreateZombies < ActiveRecord::Migration[5.0]
  def change
    create_table :zombies do |t|
      t.string :name
      t.integer :age
      t.integer :weight
      t.string :status

      t.timestamps
    end
  end
end
