class CreateAlices < ActiveRecord::Migration[7.0]
  def change
    create_table :alices do |t|
      t.integer :alice

      t.timestamps
    end
  end
end
