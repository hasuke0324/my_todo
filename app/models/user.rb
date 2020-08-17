class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by(name: 'guest', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  validates :name, presence: true, uniqueness: true

  has_many :tasks
end
