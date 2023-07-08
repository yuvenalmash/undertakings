class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # Associations
  has_many :tasks, dependent: :destroy

  def generate_jwt
    JWT.encode({ id: id,
                 exp: 1.day.from_now.to_i },
               Rails.application.credentials.secret_key_base)
  end
end
