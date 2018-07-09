class CreateArsenals < ActiveRecord::Migration[5.1]
  def change
    create_table :arsenals do |t|
      t.integer :captain_id
      t.integer :skyfarer_id
      t.integer :weapon_id
      t.boolean :equipped

      t.timestamps
    end

    add_index("arsenals", ['captain_id', 'weapon_id'])
    add_index("arsenals", ['skyfarer_id', 'weapon_id'])

  end
end
