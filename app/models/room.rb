class Room < ApplicationRecord
  belongs_to :public_facility
  has_many :room_tags, dependent: :destroy
end
