class Api::V1::SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :update, :destroy]

  def index
    if logged_in?
      @schedules = current_user.schedules

      render json: ScheduleSerializer.new(@schedules)
    else
      render json: {
        error: 'You must be logged in to see your schedule'
      }
    end
  end

  def show
    render json: @schedule
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)

    if @schedule.save
      render json: ScheduleSerializer.new(@schedule), status: :created
    else
      error_resp = {
        error: @schedule.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  def update
    if @schedule.update(schedule_params)
      render json: ScheduleSerializer.new(@schedule), status: :ok
    else
      error_resp = {
        error: @schedule.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  def destroy
    if @schedule.destroy
      render json: { data: 'Schedule successfully deleted' }, status: :ok
    else
      error_resp = {
        error: 'Schedule found and not deleted'
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  private

  def set_schedule
    @schedule = Schedule.find_by(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:name, :start, :end, :description, :year, :user_id)
  end
end
