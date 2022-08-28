class Event < ApplicationRecord
  validate :start_end_check
  validate :start_check
  # lengthについては仮、要検討
  validates :name, presence: true, length: { maximum: 255 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :detail, presence: true, length: {maximum: 65535}
  validates :capacity, presence: true, numericality: {in: 2...100, only_integer: true}
  validates :status, presence: true

  belongs_to :user
  has_many :event_comments, dependent: :destroy
  has_many :event_tags, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :tags, through: :event_tags
  has_many :participant_users, through: :participants, source: :user


  enum status: { "施設予約": 0, "施設予約済": 1, "中止": 3 }

  # 開始日と終了日の逆転を防ぐ
  # エラー文検討
  def start_end_check
    if start_time > end_time
      errors.add(:end_time, "開始日時より前の日時は選択できません。")
    end
  end
  # 開始日は3日以上前の日付で設定
  # 何日前にするかは要検討
  def start_check
    if start_time  < Date.today + 3
      errors.add(:start_time, "三日以内の日時は選択できません。")
    end
  end
end
