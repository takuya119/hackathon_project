class EventComment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event
  has_many :event_replies, dependent: :destroy
end
