require "rails_helper"

RSpec.describe "customers Subsriptions API", type: :request do
  describe "customers Subsriptions API", type: :request do
    it "can create a new customer subscription - happy" do
      customer = create(:customer)
      expect(Subscription.count).to eq(0)

      post "/api/v1/customers/#{customer.id}/subscriptions", params: { subscription: { title: "test_subscription", price: 10.00, customer_id: customer.id, frequency: "monthly" } }

      expect(response.status).to eq(201)
      expect(customer.subscriptions.count).to eq(1)

      customer_subscription = customer.subscriptions.last
      expect(customer_subscription.title).to eq("test_subscription")
      expect(customer_subscription.price).to eq(10.00)
      expect(customer_subscription.customer_id).to eq(customer.id)
      expect(customer_subscription.status).to eq("active")
      expect(customer_subscription.frequency).to eq("monthly")
    end

    it "can create a new customer subscription - sad" do
      customer = create(:customer)
      expect(Subscription.count).to eq(0)

      post "/api/v1/customers/#{customer.id}/subscriptions", params: { subscription: { title: nil, price: 10.00, customer_id: customer.id, frequency: "monthly" } }

      expect(response.status).to eq(422)
      expect(customer.subscriptions.count).to eq(0)
    end

    it "can remove a customer subscription" do
      customer = create(:customer)
      post "/api/v1/customers/#{customer.id}/subscriptions", params: { subscription: { title: "test_subscription", price: 10.00, customer_id: customer.id, frequency: "monthly" } }
      expect(customer.subscriptions.count).to eq(1)

      delete "/api/v1/customers/#{customer.id}/subscriptions/#{customer.subscriptions.last.id}"
      expect(response.status).to eq(204)
      expect(customer.subscriptions.count).to eq(0)
    end

    it "can update a customer subscription - canceleld" do
      customer = create(:customer)
      post "/api/v1/customers/#{customer.id}/subscriptions", params: { subscription: { title: "test_subscription", price: 10.00, customer_id: customer.id, frequency: "monthly" } }
      expect(customer.subscriptions.count).to eq(1)
      expect(customer.subscriptions.last.status).to eq("active")

      patch "/api/v1/customers/#{customer.id}/subscriptions/#{customer.subscriptions.last.id}", params: { subscription: { status: "cancelled" } }
      expect(response.status).to eq(200)
      expect(customer.subscriptions.last.status).to eq("cancelled")
      expect(response.message).to eq("OK")
    end

    it "can show all customer subscriptions" do
      customer = create(:customer)
      subscription_1 = create(:subscription, customer: customer)
      subscription_2 = create(:subscription, customer: customer)
      subscription_3 = create(:subscription, customer: customer)

      get "/api/v1/customers/#{customer.id}/subscriptions"

      expect(response.status).to eq(200)

      subs = JSON.parse(response.body, symbolize_names: true)

      expect(subs[:data].count).to eq(3)

      sub_1 = subs[:data][0]

      expect(sub_1[:attributes][:title]).to eq(subscription_1.title)
      expect(sub_1[:attributes][:price]).to eq(subscription_1.price)
      expect(sub_1[:attributes][:status]).to eq(subscription_1.status)
      expect(sub_1[:attributes][:frequency]).to eq(subscription_1.frequency)
      expect(sub_1[:attributes][:customer_id]).to eq(subscription_1.customer_id)

    end
  end
end
