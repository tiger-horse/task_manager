class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_name, null: false
      t.text :content
      t.datetime :start_time, null: false
      t.boolean :is_completed, default: false
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :edit_user, foreign_key: {to_table: :users}, default: nil
      t.integer :category_id
      t.timestamps
    end
  end
end
