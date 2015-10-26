class User < ActiveRecord::Base
  # :confirmable, :lockable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable,
         :omniauthable,
         :timeoutable

    has_many :photos, through: :albums, dependent: :destroy
    has_many :albums, dependent: :destroy
end