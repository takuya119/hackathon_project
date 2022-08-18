class PublicFacility < ApplicationRecord
  belongs_to :municipality
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :facility_comments, dependent: :destroy
  has_many :events, dependent: :destroy
end
