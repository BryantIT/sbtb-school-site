class Api::V1::StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]

  def index
    @students = Student.all

    render json: StudentSerializer.new(@students)
  end

  def show
    @student_json = StudentSerializer.new(@student).serialized_json
    render json: @student_json
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      session[:student_id] = @student.id
      render json: StudentSerializer.new(@student), status: :created
    else
      resp = {
        error: @student.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      render json: @student
    else
      render json @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :middle_initial,
      :email, :age, :grade_level, :about, :password, :teacher_id, :role, :enrolled,
      :status, :parent_id)
  end
end
