class AnswerOne < ApplicationRecord

validates :correcta, presence: true
validates :opc1, presence: true
validates :opc2, presence: true
validates :opc3, presence: true

belongs_to :question

end
