class Api::V1::TeasController < ApplicationController
  def index
    @teas = Tea.all
    render json: @teas
  end

  def create
    @tea = Tea.new(tea_params)
    if @tea.save
      render json: @tea
    else
      render json: { errors: @tea.errors.full_messages }, status: 422
    end
  end

  def destroy
    @tea = Tea.find(params[:id])
    @tea.destroy
  end
end