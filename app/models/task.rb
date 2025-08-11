class Task < ApplicationRecord
  has_one_attached :eyecatch

  validates :user_id, presence: true
  validates :board_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :due_at, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :board

  def comment_count
    comments.count
  end
end
