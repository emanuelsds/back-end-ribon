class Trophy < ApplicationRecord
  belongs_to :user
  validates :user_id, :level, :trophy, presence: true
end
