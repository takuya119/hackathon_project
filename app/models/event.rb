class Event < ApplicationRecord
  belongs_to :user
  has_many :event_comments, dependent: :destroy
  has_many :event_tags, dependent: :destroy
  has_many :participants, dependent: :destroy
end
