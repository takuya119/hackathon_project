class FacilityComment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :public_facility
  belongs_to :room, optional: true
  has_many :facility_replies, dependent: :destroy

  validates :name, length: { maximum: 65_535 } # レイアウトによって調整
  validates :content, presence: true, length: { maximum: 65_535 } # レイアウトによって調整

  enum comment_type: { normal: 0, question: 1 } # 変更する可能性あり
end
