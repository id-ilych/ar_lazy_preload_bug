class CreateBobs < ActiveRecord::Migration[7.0]
  def change
    create_table :bobs do |t|
      t.integer :bob
      t.references :alice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
