class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :bookmarks, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :public_facilities, dependent: :destroy
end
