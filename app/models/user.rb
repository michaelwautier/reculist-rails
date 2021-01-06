class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks

  validates :email, format: { with: /\A(\S+)@(([a-z]{3,})\.([a-z]{2,}))\z/ }
end
