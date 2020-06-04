class Api::V1::TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :update, :destroy]

  def index
    @teachers = Teacher.all

    render json: TeacherSerializer.new(@teachers)
  end

  def show
    @teacher_json = TeacherSerializer.new(@teacher).serialized_json
    render json: @teacher_json
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      session[:teacher_id] = @teacher.id
      render json: TeacherSerializer.new(@teacher), status: :created
    else
      resp = {
        error: @teacher.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    if @teacher.update(teacher_params)
      render json: @teacher
    else
      render json @teacher.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @teacher.destroy
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :middle_initial,
      :email, :about, :password, :role)
  end
end
