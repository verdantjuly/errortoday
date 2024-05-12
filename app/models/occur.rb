class Occur < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :error, class_name: "Error", foreign_key: "error_id"
end
