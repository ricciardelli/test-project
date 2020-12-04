class Subscription < ApplicationRecord
  belongs_to :broadcast
  has_person_name
  validates :email, presence: true, uniqueness: true
end
