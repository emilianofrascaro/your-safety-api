class Api::V1::FaqsController < ApplicationController
  before_action :authenticate_request

  def index
    @faqs = Faq.all
    render json: @faqs
  end

  def show
    @faq = Faq.find(params[:id])
    render json: @faq
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'FAQ non trovata' }, status: :not_found
  end
end
