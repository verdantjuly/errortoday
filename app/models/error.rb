class Error < ApplicationRecord
  # Associations
  belongs_to :user,  class_name: "User", foreign_key: "user_id"
  has_many :occurs, foreign_key: "error_id", dependent: :destroy
  has_many :comments, foreign_key: "error_id",dependent: :destroy

  # Validations
  validates :error, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "error", "id", "id_value", "today", "updated_at", "user_id", "occurs_id", "comments_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    # List of associations that are allowed to be searched by Ransack
    []
  end
end
