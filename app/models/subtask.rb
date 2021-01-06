class Subtask < ApplicationRecord
  belongs_to :task

  validates :content, presence: true
  validates :content, length: { minimum: 2 }
end
