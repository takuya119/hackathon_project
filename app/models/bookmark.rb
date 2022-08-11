class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :public_facility
end
