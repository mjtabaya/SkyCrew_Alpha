class CreateSkyfarers < ActiveRecord::Migration[5.1]
  def change
    create_table :skyfarers do |t|
      t.integer :captain_id
      t.string :name
      t.string :race
      t.string :profession
      t.decimal :base_attack
      t.decimal :base_defense
      t.string :state

      t.timestamps
    end
  end
end
