class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # Associations
   has_many :error, foreign_key: "user_id"
   has_many :occur, foreign_key: "user_id"
   has_many :comment, foreign_key: "user_id"
end
