#Clase CoursesController
#Esta clase es la encargada de hacer todas las acciones CRUD en la tabla course.
class CoursesController < ApplicationController

  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_teacher?, only: [:create, :edit, :update, :destroy, :new]
  before_action :authenticate_student?, only: [:inscribir]
  
  #Este método nos listará todos los cursos
  def index

  if current_user.is_teacher_user?
     @courses = Course.where(user_id: current_user.id)

  else
    @courses = Course.all

    if HasCourse.exists?(:user_id => current_user.id)
    @c_inscritos = HasCourse.where(user_id: current_user.id)
    
  else
    @prueba="no"
    @c_inscritos =nil
    end 
  end

    
  end

  # Método para visualizar determinado curso.
  def show
  @test = Test.new

  end
  #Método para inscribir estudiantes en un curso.
  def inscribir
    @course = Course.find(params[:id])
    
    if HasCourse.exists?(:user_id => current_user.id, :course_id => @course.id)
      
    else
      HasCourse.create(course_id: @course.id, user_id: current_user.id)
    end

  end
  #Método para listar estudiantes en un curso.
  def inscritos
  @inscritos = HasCourse.where(course_id: params[:id])
  @course = Course.find(params[:id])
  end

  #Método para crear en un objeto de curso.
  def new
    @course = Course.new
  end

  #Método para editar (Desplegar formulario) en un curso.
  def edit
  end

  
  #Método para guardar curso en la base de datos.
  def create
    @course = current_user.courses.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  #Método para guardar cambios de un curso en la base de datos.
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  #Método para elimnar en un curso.
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    #Método set de un curso.
    def set_course
      @course = Course.find(params[:id])
    end
    #Método para establecer que variables se van a permitir.
    def course_params
      params.require(:course).permit(:nombre, :cupo, :descripcion)
    end
end
