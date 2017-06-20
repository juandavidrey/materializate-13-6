class AnswerOne < ApplicationRecord

validates :correcta,:presence => {:message => "no puede estar vacía."}
validates :opc1, :presence => {:message => "no puede estar vacía."}
validates :opc2, :presence => {:message => "no puede estar vacía."}
validates :opc3, :presence => {:message => "no puede estar vacía."}

belongs_to :question

end
