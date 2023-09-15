class Api::V1::SubscriptionsController < ApplicationController

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      render json: @subscription, status: 201
    else
      render json: { errors: @subscription.errors.full_messages }, status: 422
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
  end

  def index
    @subscriptions = Subscription.where(customer_id: params[:customer_id])
    render json: SubscriptionSerializer.new(@subscriptions)
  end

  def update
    @subscription = Subscription.find(params[:id])
    @subscription.update(status: params[:subscription][:status])

    render json: ModifySerializer.success_message, status: 200
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :customer_id, :status, :frequency)
  end
end