class RenameWeaponTypeColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column("weapons", "type", "weapon_type")
  end
end
