class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :name, null: false
      t.references :room, null: false, foreign_key: { to_tble: :users }
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
