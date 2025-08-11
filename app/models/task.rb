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

  def unique_commenter_avatar_images
    displayed_user_ids = [user_id]

    comments.map do |comment|
      unless displayed_user_ids.include?(comment.user_id)
        avatar = comment.user.avatar_image
        displayed_user_ids << comment.user_id if avatar.present?
        avatar
      end
    end.compact
  end

  def comment_count
    comments.count
  end
end
