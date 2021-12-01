class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #TODO: agregar todos los dependent destroy a los modelos que tengan FK asociadas
  belongs_to :user_type
  has_many :orders
  has_many :pyme_projects
  has_many :comments
end
