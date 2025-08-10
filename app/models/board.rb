class Board < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :tasks, dependent: :destroy
  belongs_to :user
end
