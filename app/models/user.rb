class User < ApplicationRecord
  has_many :wines, class_name: 'Wine'

  # Add the username attribute
  validates :username, presence: true, uniqueness: true

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
