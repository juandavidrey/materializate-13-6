module RegistryConcerns

	extend ActiveSupport::Concern

	def is_registered(id_user, id_course)
		HasCourse.exists?(:user_id => id_user, :course_id => id_course)
	end

end