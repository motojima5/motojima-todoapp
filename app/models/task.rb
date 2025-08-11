class Task < ApplicationRecord
  has_one_attached :eyecatch

  validates :user_id, presence: true
  validates :board_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :due_at, presence: true

  belongs_to :user
  belongs_to :board
end
