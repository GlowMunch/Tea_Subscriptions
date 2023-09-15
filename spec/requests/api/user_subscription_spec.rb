require rails_helper

describe "users Subsriptions API", type: :request do
  it "can create a new user subscription - happy" do
    user = user.create(username: "test_user", password: "test_password")

    post "/api/v1/users/#{user.id}/subscriptions", params: { subscription: { name: "test_subscription", cost: 10.00, user_id: user.id } }

    expect(response).to be_successful

  end
end