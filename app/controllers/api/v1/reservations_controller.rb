class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_request
  before_action :set_reservation, only: [:show, :update, :destroy]

  def index
    @reservations = current_user.reservations.includes(:exams)
    render json: @reservations, include: :exams
  end

  def show
    render json: @reservation, include: :exams
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created, include: :exams
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: @reservation, include: :exams
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    head :no_content
  end

  private

  def set_reservation
    @reservation = current_user.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:name, :date, :time, :address, exam_ids: [])
  end
end
