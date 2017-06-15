#==Clase ApplicationController
#Esta clase hereda de ActionController::Base. Nos permitirá interactuar
#con la base de datos.

class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?
	  
	protected

	#Este método nos permite configurar que parametros serán permitidos para registrar un usuario.
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username, :nivel, :name, :email, :password, :password_confirmation)}
		end
	#Método para autenticar si el usuario que inició sesión es estudiante.
	def authenticate_student?
		redirect_to root_path unless user_signed_in? && current_user.is_student_user?
		end
	#Método para autenticar si el usuario que inició sesión es profesor.
	def authenticate_teacher?
		redirect_to root_path unless user_signed_in? && current_user.is_teacher_user?
		end



end

