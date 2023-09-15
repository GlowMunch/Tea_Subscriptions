class Api::V1::CustomersContrller < ApplicationController

  def post
    @customer = customer.find(params[:id])
    @customer.update(params)
  end

  def index
    @customers = customer.all
  end

  def show
    @customer = customer.find(params[:id])
  end

end