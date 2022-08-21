class EventReply < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event_comment
end
