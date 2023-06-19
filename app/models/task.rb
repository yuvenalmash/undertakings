class Task < ApplicationRecord
  validates :title, presence: true

  # Associations
  belongs_to :user

  # Scopes
  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
end
