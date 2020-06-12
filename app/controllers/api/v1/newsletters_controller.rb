class Api::V1::NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :update, :destroy]

  def index
    @newsletters = Newsletter.all

    render json: NewsletterSerializer.new(@newsletters)
  end

  def show
    @newsletter_json = NewsletterSerializer.new(@newsletter).serialized_json
    render json: @newsletter_json
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
      session[:newsletter_id] = @newsletter.id
      render json: NewsletterSerializer.new(@newsletter), status: :created
    else
      resp = {
        error: @newsletter.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    if @newsletter.update(newsletter_params)
      render json: @newsletter
    else
      render json @newsletter.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @newsletter.destroy
  end

  private

  def set_newsletter
    @newsletter = Newsletter.find(params[:id])
  end

  def newsletter_params
    params.require(:newsletter).permit(:title, :published, :author, :body)
  end
end
