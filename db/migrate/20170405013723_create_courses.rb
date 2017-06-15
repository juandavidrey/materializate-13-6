class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :nombre
      t.integer :cupo
      t.text :descripcion

      t.timestamps
    end
  end
end
