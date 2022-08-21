class FacilityReply < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :facility_comment
end
