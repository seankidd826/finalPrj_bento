class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :email
  devise :omniauthable, :omniauth_providers => [:facebook]

  # create many to many (menus) relation
  has_many :user_menus
  has_many :menus, :through => :user_menus, :source => "menu"

  # create many to many (likes) relation
  has_many :likes
  has_many :menu_likes, :through => :likes, :source => "menu"

  # create one to many (orders) relation
  has_many :orders

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.fb_image = auth.info.image # assuming the user model has an image
    end
  end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
