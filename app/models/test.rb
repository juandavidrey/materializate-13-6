class Test < ApplicationRecord

belongs_to :course
validates :title, presence: true
has_many :questions
end
