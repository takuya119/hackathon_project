class Event < ApplicationRecord
  belongs_to :user
  has_many :event_comments, dependent: :destroy
  has_many :event_tags, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :tags, through: :event_tags
  has_many :participant_users, through: :participants, source: :user

  enum status: { 施設未予約: 0, 施設予約済み: 1, 中止: 2}

end
