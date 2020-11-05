class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
   validates :nickname               
   validates :first_name            
   validates :family_name          
   validates :first_name_kana      
   validates :family_name_kana     
   validates :birthday               
  end
   VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i.freeze
   validates :password, format: { with: VALID_PASSWORD_REGEX }
end
