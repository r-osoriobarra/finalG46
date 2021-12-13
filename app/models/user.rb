class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  
  belongs_to :user_type
  has_many :donations
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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end
  
end
