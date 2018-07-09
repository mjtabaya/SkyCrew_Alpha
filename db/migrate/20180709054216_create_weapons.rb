class CreateWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :weapons do |t|
      t.string :name
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end
