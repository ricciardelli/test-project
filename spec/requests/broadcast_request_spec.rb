require 'rails_helper'

RSpec.describe "Return all broadcasts", type: :request do

  let!(:broadcast) { Broadcast.create(title: 'Testing', broadcast_date: Date.new) }

  describe "GET /broadcasts" do

    it "returns all existing broadcasts" do
      get "/broadcasts"

      expect(response.status).to eq(200)

      json = JSON.parse(response.body).first.deep_symbolize_keys
      expect(json[:id]).to eq(broadcast.id)
      expect(json[:title]).to eq(broadcast.title)
      expect(json[:subscription_count]).to eq(nil)
    end
  end
end

RSpec.describe "Return all broadcasts and the number of subscriptions", type: :request do

  let!(:broadcast) { Broadcast.create(title: 'Testing', broadcast_date: Date.new) }
  let!(:subscription) { Subscription.create(first_name: 'Richard', last_name: 'Ricciardelli', email: 'testing@gmail.com', broadcast: broadcast) }

  describe "GET /broadcasts" do

    it "returns all existing broadcasts with number of subscriptions" do
      get "/broadcasts"

      expect(response.status).to eq(200)

      json = JSON.parse(response.body).first.deep_symbolize_keys
      expect(json[:id]).to eq(broadcast.id)
      expect(json[:title]).to eq(broadcast.title)
      expect(json[:subscriptions_count]).to eq(1)
    end
  end
end

RSpec.describe "Return a single broadcast", type: :request do

  let!(:broadcast) { Broadcast.create(title: 'Testing', broadcast_date: Date.new) }

  describe "GET /broadcasts/1" do

    it "returns a single broadcast" do
      get "/broadcasts/#{broadcast.id}"

      expect(response.status).to eq(200)

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:id]).to eq(broadcast.id)
      expect(json[:title]).to eq(broadcast.title)
      expect(json[:subscriptions_count]).to eq(0)
    end
  end
end