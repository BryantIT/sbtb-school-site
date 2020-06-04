class Api::V1::ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :update, :destroy]

  def index
    @parents = Parent.all

    render json: ParentSerializer.new(@parents)
  end

  def show
    @parent_json = ParentSerializer.new(@parent).serialized_json
    render json: @parent_json
  end

  def create
    @parent = Parent.new(parent_params)

    if @parent.save
      session[:parent_id] = @parent.id
      render json: ParentSerializer.new(@parent), status: :created
    else
      resp = {
        error: @parent.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    if @parent.update(parent_params)
      render json: @parent
    else
      render json @parent.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @parent.destroy
  end

  private

  def set_parent
    @parent = Parent.find(params[:id])
  end

  def parent_params
    params.require(:parent).permit(:first_name, :last_name, :middle_initial,
      :email, :about, :password, :student_id, :role)
  end
end
