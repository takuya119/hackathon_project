class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :public_facility

  validates :user_id, uniqueness: { scope: :public_facility_id }
end
