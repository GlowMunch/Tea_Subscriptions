class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_paramsparams)
    if @subscription.save
      render json: @subscription
    else
      render json: { errors: @subscription.errors.full_messages }, status: 422
    end
  end

  def index
    @subscriptions = Subscription.all
    render json: @subscriptions
  end

  def show
    @subscription = Subscription.find(subscription_params[:id])
    render json: @subscription
  end

  private

  def subscription_params
    params.require(:subscription).permit(:user_id, :plan_id)
  end
end