class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable


         def self.ransackable_attributes(auth_object = nil)
          # List of attributes that are allowed to be searched by Ransack
          %w[id email created_at updated_at]
        end

        def self.ransackable_associations(auth_object = nil)
          # List of associations that are allowed to be searched by Ransack
          []
        end
end
