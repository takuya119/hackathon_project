class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_facilities, through: :bookmarks, source: :public_facility
  has_many :events, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :public_facilities # 必要そうなので関連付け

  enum role: { general: 0, admin: 1 } # 変更する可能性あり

  def bookmark(public_facility)
    bookmark_facilities << public_facility
  end

  def unbookmark(public_facility)
    bookmark_facilities.destroy(public_facility)
  end

  def bookmark?(public_facility)
    bookmark_facilities.include?(public_facility)
  end
end
