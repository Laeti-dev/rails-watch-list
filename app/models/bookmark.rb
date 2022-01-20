class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  has_one_attached :photo
  validates :comment, presence: true, length: { minimum: 7 }
  validates_uniqueness_of :movie, scope: :list
end
