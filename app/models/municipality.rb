class Municipality < ApplicationRecord
  has_many :public_facilities, dependent: :destroy
end
