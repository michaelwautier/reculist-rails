class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :subtasks, dependent: :destroy

  validates :title, :category, presence: true
  validates :title, length: { minimum: 2 }
end
