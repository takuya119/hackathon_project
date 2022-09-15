class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :bookmarks, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :public_facilities, dependent: :destroy
  has_many :bookmark_facilities, through: :bookmarks, source: :public_facility
  has_many :participant_events, through: :participants, source: :event

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, uniqueness: true, allow_nil: true

  enum role: { general: 0, admin: 1 } # 変更する可能性あり

  def bookmark(public_facility)
    bookmark_facilities << public_facility
  end

  def unbookmark(public_facility)
    bookmark_facilities.destroy(public_facility)
  end

  def bookmark?(public_facility)
    public_facility.bookmarks.pluck(:user_id).include?(id)
  end

  def participation(event)
    participant_events << event
  end

  def unparticipation(event)
    participant_events.destroy(event)
  end

  def participation?(event)
    participant_events.include?(event)
  end

  def own_event?(event)
    id == event.user_id
  end
end
