class FacilityComment < ApplicationRecord
  belongs_to :public_facility
  belongs_to :room, optional: true # nullを許可するために必要
  has_many :facility_replies, dependent: :destroy

  validates :content, presence: true, length: { maximum: 65_535 } # レイアウトによって調整
end
