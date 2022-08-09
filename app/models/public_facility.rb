class PublicFacility < ApplicationRecord
  belongs_to :municipality
  has_many :bookmarks, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :facility_comments, dependent: :destroy
end
