class Error < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :occurs
  has_many :comments

  # Validations
  validates :error, presence: true
end
