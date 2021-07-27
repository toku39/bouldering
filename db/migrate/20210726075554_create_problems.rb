class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.string :setter
      t.integer :grade_id,      null: false
      t.string :area,           null: false
      t.text :memo,             null: false
      t.references :user,       null: false, foreign_key: true
      t.integer :climb_done_id, null: false

      t.timestamps
    end
  end
end
