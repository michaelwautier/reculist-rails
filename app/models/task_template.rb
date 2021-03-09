class TaskTemplate < ApplicationRecord
  belongs_to :user
  has_many :subtask_templates

  validates :title, presence: true, length: { minimum: 2 }
  validates :category, presence: true, length: { minimum: 2 }
end
