class Api::V1::EventsController < ApplicationController
  before_action :set_events, only: [:show, :update, :destroy]

  def index
    @events = Event.all

    render json: EventSerializer.new(@events)
  end

  def show
    @event_json = EventSerializer.new(@event).serialized_json
    render json: @event_json
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      session[:event_id] = @event.id
      render json: EventSerializer.new(@event), status: :created
    else
      resp = {
        error: @event.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:date, :body, :link)
  end
end
