class Error < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :occurs, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Validations
  validates :error, presence: true
end
