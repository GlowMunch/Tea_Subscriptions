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
  end
end
