#Clase RegistrationsController
#Esta clase es la encargada de registrar un usuario.La gestión de usuario fue creada con la gema devise. 
class RegistrationsController < Devise::RegistrationsController
	#Método para crear en un objeto de registrar.
	def new
		super
	end
	#Método para guardar los datos a registrar.
	def create
		super
	end
	#Método para actualizar los datos de la cuenta.
	def update
		super
	end
end
