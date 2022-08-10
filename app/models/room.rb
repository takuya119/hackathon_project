class Room < ApplicationRecord
  belongs_to :public_facility
  has_many :room_tags, dependent: :destroy
  has_many :facility_comments, dependent: :destroy
end
