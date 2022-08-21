class Tag < ApplicationRecord
  has_many :event_tags, dependent: :destroy
  has_many :room_tags, dependent: :destroy
end
