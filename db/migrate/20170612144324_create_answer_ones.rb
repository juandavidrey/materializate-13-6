class CreateAnswerOnes < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_ones do |t|
      t.string :correcta
      t.string :opc1
      t.string :opc2
      t.string :opc3

      t.timestamps
    end
  end
end
