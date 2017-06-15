class AddQuestionIdToAnswerOne < ActiveRecord::Migration[5.0]
  def change
    add_reference :answer_ones, :question, foreign_key: true
  end
end
