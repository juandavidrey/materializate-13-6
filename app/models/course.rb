class Course < ApplicationRecord
belongs_to :user
has_many :tests
validates :nombre, :presence => {:message => "del curso no puede estar vacío."}

end
