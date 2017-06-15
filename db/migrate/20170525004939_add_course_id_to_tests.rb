class AddCourseIdToTests < ActiveRecord::Migration[5.0]
  def change
    add_reference :tests, :course, foreign_key: true
  end
end
