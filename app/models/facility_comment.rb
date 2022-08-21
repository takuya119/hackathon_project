class FacilityComment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :public_facility
  belongs_to :room, optional: true
  has_many :facility_replies, dependent: :destroy
end
