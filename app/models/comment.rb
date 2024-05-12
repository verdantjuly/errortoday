class Comment < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :error

  # Validations
  validates :content, presence: true
end
