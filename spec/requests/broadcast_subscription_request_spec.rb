require 'rails_helper'

RSpec.describe "Create a subscription for a broadcast", type: :request do

  describe "POST /broadcasts/1/subscriptions" do

    let!(:broadcast) { Broadcast.create(title: 'Testing', broadcast_date: Date.new) }

    it "returns subscription created" do
      post "/broadcasts/#{broadcast.id}/subscriptions", params: {
          subscription: {
            first_name: 'Richard',
            last_name: 'Ricciardelli',
            email: 'testing1@gmail.com'
          }
      }

      expect(response.status).to eq(201)

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:broadcast_id]).to eq(broadcast.id)
      expect(json[:watched]).to eq(nil)
      expect(json[:email]).to eq('testing1@gmail.com')
      expect(json[:first_name]).to eq('Richard')
      expect(json[:last_name]).to eq('Ricciardelli')
      expect(json[:registration_ip]).to eq(nil)

      # The bookmark title and url should be updated
      expect(broadcast.subscriptions_count).to eq(1)
    end
  end
end

RSpec.describe "Create a subscription for a broadcast but email is already taken", type: :request do

  describe "POST /broadcasts/1/subscriptions" do

    let!(:broadcast) { Broadcast.create(title: 'Testing', broadcast_date: Date.new) }
    let!(:subscription) { Subscription.create(first_name: 'Richard', last_name: 'Ricciardelli', email: 'testing@gmail.com', broadcast: broadcast) }

    it "returns error" do
      post "/broadcasts/#{broadcast.id}/subscriptions", params: {
          subscription: {
            first_name: 'Richard',
            last_name: 'Ricciardelli',
            email: 'testing@gmail.com'
          }
      }

      expect(response.status).to eq(400)
    end
  end
end