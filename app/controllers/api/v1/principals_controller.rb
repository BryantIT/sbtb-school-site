class Api::V1::PrincipalsController < ApplicationController
  before_action :set_principal, only: [:show, :update, :destroy]

  def index
    @principals = Principal.all

    render json: PrincipalSerializer.new(@principals)
  end

  def show
    @principal_json = PrincipalSerializer.new(@principal).serialized_json
    render json: @principal_json
  end

  def create
    @principal = Principal.new(principal_params)

    if @principal.save
      session[:principal_id] = @principal.id
      render json: PrincipalSerializer.new(@principal), status: :created
    else
      resp = {
        error: @principal.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    if @principal.update(principal_params)
      render json: @principal
    else
      render json @principal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @principal.destroy
  end

  private

  def set_principal
    @principal = Principal.find(params[:id])
  end

  def principal_params
    params.require(:principal).permit(:first_name, :last_name, :middle_initial,
      :email, :about, :password, :role)
  end
end
