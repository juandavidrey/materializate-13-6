#Clase QuestionsController
#Esta clase es la encargada de hacer todas las acciones CRUD en la tabla question
class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  #Este método nos listará todos las preguntas
  def index
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @questions = Question.where(test_id: @test.id)
    
  end

 # Método para visualizar determinada pregunta.
  def show
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:id])
  end

   #Método para crear en un objeto de question.
  def new
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @question = @test.questions.new
  end

  #Método para editar (Desplegar formulario) en una pregunta.
  def edit
  @course = Course.find(params[:course_id])
  @test = Test.find(params[:test_id])
  @question = @test.questions.find(params[:id])
  end

  #Método para guardar pregunta en la base de datos.
  def create
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])

    
    @question = @test.questions.create(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to course_test_question_url([@course,@test,@question]), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  #Método para guardar cambios de una pregunta en la base de datos.
  def update
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:id])
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to course_test_question_url([@course,@test,@question]), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  #Método para elimnar en una pregunta.
  def destroy
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @question = @test.questions.find(params[:id])
    @question.destroy
    respond_to do |format|
      format.html { redirect_to course_test_questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   #Método set de una pregunta.
    def set_question
      @question = Question.find(params[:id])
    end

    #Método para establecer que variables se van a permitir.
    def question_params
      params.require(:question).permit(:title)
    end
end
