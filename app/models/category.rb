class Category < ApplicationRecord
  has_many :tasks

  validates :name, presence: true, length: { minimum: 2 }
end
