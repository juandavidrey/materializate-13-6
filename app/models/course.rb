class Course < ApplicationRecord
belongs_to :user
has_many :tests
validates :nombre, presence: true
#validates :cupo, presence: true
end
