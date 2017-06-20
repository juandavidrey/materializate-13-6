class Test < ApplicationRecord

belongs_to :course
validates :title, :presence => {:message => "no puede estar vacía."}
has_many :questions
end
