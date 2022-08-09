class FacilityComment < ApplicationRecord
  belongs_to :public_facility
  has_many :facility_replies, dependent: :destroy
  has_many :rooms, dependent: :destroy
end
