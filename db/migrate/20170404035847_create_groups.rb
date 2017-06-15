class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :titulo
      t.integer :cupo
      t.integer :inscrito
      t.text :descripcion

      t.timestamps
    end
  end
end
