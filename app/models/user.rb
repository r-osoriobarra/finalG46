class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :user_type
  has_many :orders, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.my_causes(user)
    my_causes = []
    user.projects.each do |project|
      project.causes.each do |cause|
        my_causes << cause
      end
    end
    my_causes
  end
  
end
