class PublicFacility < ApplicationRecord
  belongs_to :municipality
  has_many :bookmarks, dependent: :destroy
end
