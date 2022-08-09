class Room < ApplicationRecord
  belongs_to :public_facility
  belongs_to :facility_comment
  has_many :room_tags, dependent: :destroy
end
