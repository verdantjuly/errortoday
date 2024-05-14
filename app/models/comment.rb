class Comment < ApplicationRecord
  # Associations
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :error , class_name: "Error", foreign_key: "error_id"

  # Validations
  validates :content, presence: true
  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "error_id", "id", "id_value", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    # List of associations that are allowed to be searched by Ransack
    []
  end
end
