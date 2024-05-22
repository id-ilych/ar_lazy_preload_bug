class CreateCharlies < ActiveRecord::Migration[7.0]
  def change
    create_table :charlies do |t|
      t.integer :charlie
      t.references :bob, null: false, foreign_key: true

      t.timestamps
    end
  end
end
