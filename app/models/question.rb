class Question < ApplicationRecord

validates :title, presence: true
belongs_to :test
has_many :answer_one
end
