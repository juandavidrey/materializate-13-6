module PermissionConcerns
	extend ActiveSupport::Concern

	def is_student_user?
		self.nivel == "1"	
	end

	def is_teacher_user?
		self.nivel == "2"
	end

end