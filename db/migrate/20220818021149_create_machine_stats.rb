class CreateMachineStats < ActiveRecord::Migration[7.0]
  def change
    create_table :machine_stats do |t|
      t.integer :sales
      t.string :currency
      t.integer :active_wifi_users
      t.references :machine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
