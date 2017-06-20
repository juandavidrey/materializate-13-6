class Question < ApplicationRecord

validates :title, :presence => {:message => "no puede estar vacía."}
belongs_to :test
has_many :answer_one
end
