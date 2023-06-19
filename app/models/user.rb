class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # Associations
  has_many :tasks, dependent: :destroy
end
