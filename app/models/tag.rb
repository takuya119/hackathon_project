class Tag < ApplicationRecord
  has_many :event_tags, dependent: :destroy
  has_many :room_tags, dependent: :destroy
  has_many :events, through: :event_tags
  has_many :rooms, through: :room_tags
end
