class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # Associations
   has_many :error, foreign_key: "user_id", dependent: :destroy
   has_many :occur, foreign_key: "user_id" ,dependent: :destroy
   has_many :comment, foreign_key: "user_id",dependent: :destroy
   def self.ransackable_attributes(auth_object = nil)
    ["comment_id","occur_id","error_id","created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end

   def self.ransackable_associations(auth_object = nil)
    # List of associations that are allowed to be searched by Ransack
    []
  end
end
