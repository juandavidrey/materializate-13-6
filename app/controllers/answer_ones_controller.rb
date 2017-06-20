 #-a -o documento ejemplo_rdoc.rb --op
#Clase CoursesController
#Esta clase es la encargada de hacer todas las acciones CRUD en la tabla answer.
class AnswerOnesController < ApplicationController
before_action :set_answer_one, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!
before_action :authenticate_teacher?, only: [:index, :create, :edit, :update, :destroy, :show]
  #Este método nos listará todos las respuestas
  def index
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
    @answer_ones = AnswerOne.where(question_id: @question.id)
  end

  # Método para visualizar determinada respuesta.
  def show
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
    @answer_one = AnswerOne.find(params[:id])

  end

  #Método para crear en un objeto de asnwer.
  def new
     @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
    @answer_one = @question.answer_one.new
  end

  #Método para editar (Desplegar formulario) una respuesta.
  def edit

    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
     @answer_one = AnswerOne.find(params[:id])

  end

 #Método para guardar respuesta en la base de datos.
  def create
     @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
    @answer_one = @question.answer_one.new(answer_one_params)

    respond_to do |format|
      if @answer_one.save
        format.html { redirect_to course_test_question_answer_one_path(@course,@test,@question,@answer_one), notice: 'Answer one was successfully created.' }
        format.json { render :show, status: :created, location: @answer_one }
      else
        format.html { render :new }
        format.json { render json: @answer_one.errors, status: :unprocessable_entity }
      end
    end
  end

  #Método para guardar cambios de una respuesta en la base de datos.
  def update

      @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:question_id])
    respond_to do |format|
      if @answer_one.update(answer_one_params)
        format.html { redirect_to  course_test_question_answer_one_path(@course,@test,@question,@answer_one), notice: 'Answer one was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer_one }
      else
        format.html { render :edit }
        format.json { render json: @answer_one.errors, status: :unprocessable_entity }
      end
    end
  end

#Método para elimnar en una respuesta.
  def destroy
    @answer_one.destroy
    respond_to do |format|
      format.html { redirect_to answer_ones_url, notice: 'Answer one was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   #Método set de un curso.
    def set_answer_one
      @answer_one = AnswerOne.find(params[:id])
    end

    #Método para establecer que variables se van a permitir.
    def answer_one_params
      params.require(:answer_one).permit(:correcta, :opc1, :opc2, :opc3)
    end
end
