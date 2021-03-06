class Broadcast < ApplicationRecord
  has_many :subscriptions
  accepts_nested_attributes_for :subscriptions

  def subscriptions_count
    self.subscriptions.count or 0
  end
end
