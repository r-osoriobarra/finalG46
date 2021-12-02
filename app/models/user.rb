class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :user_type
  has_many :orders, dependent: :destroy
  has_many :pyme_projects, dependent: :destroy
  has_many :comments, dependent: :destroy
end
