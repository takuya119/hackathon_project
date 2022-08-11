class FacilityComment < ApplicationRecord
  belongs_to :public_facility
  belongs_to :room
  has_many :facility_replies, dependent: :destroy
end
