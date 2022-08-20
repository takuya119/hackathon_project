class FacilityReply < ApplicationRecord
  belongs_to :facility_comment

  validates :name, length: { maximum: 65_535 } # レイアウトによって調整
  validates :content, presence: true, length: { maximum: 65_535 } # レイアウトによって調整
end
