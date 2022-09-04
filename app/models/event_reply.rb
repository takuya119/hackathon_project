class EventReply < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event_comment

  has_one :event, through: :event_comment, source: :event
end
