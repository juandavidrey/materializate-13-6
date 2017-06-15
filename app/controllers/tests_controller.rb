#Clase CoursesController
#Esta clase es la encargada de hacer todas las acciones CRUD en la tabla test
class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  #Este método nos listará todos los test
  def index
    @course = Course.find(params[:course_id])
    @tests = Test.where(course_id: @course.id)
  end

  # Método para visualizar determinado test.
  def show
    @course = Course.find(params[:course_id])
    @test = @course.tests.find(params[:id])
   
  end

  #Método para crear en un objeto de test.
  def new
    @course = Course.find(params[:course_id])
    @test = @course.tests.new
    
  end

  #Método para editar (Desplegar formulario) en un curso.
  def edit
   @course = Course.find(params[:course_id])
   @test = @course.tests.find(params[:id])
  end

  #Método para guardar test en la base de datos.
  def create
    @course = Course.find(params[:course_id])
    @test = @course.tests.create(test_params)
    respond_to do |format|
      if @test.save
        format.html { redirect_to course_tests_path([@course,@test]), notice: 'Test creado existosamente' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  #Método para guardar cambios de un test en la base de datos.
  def update
    @course = Course.find(params[:course_id])
    @test = @course.tests.find(params[:id])
    respond_to do |format|
      if @test.update_attributes(test_params)
        format.html { redirect_to course_tests_path([@course,@test]), notice: 'Test actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  #Método para elimnar en un test.
  def destroy
    @course = Course.find(params[:course_id])
    @test = @course.tests.find(params[:id])
    @test.destroy
    respond_to do |format|
      format.html { redirect_to course_tests_path(), notice: 'Test fue destruido existosamente.' }
      format.json { head :no_content }
    end
  end

  private
   #Método set de un test.
    def set_test
      @test = Test.find(params[:id])
    end

    #Método para establecer que variables se van a permitir.
    def test_params
      params.require(:test).permit(:title)
    end
end
