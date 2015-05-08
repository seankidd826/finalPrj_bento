class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  # create many to many (menus) relation
  has_many :user_menus
  has_many :menus, :through => :user_menus, :source => "menu"

  # create many to many (likes) relation
  has_many :likes
  has_many :menu_likes, :through => :likes, :source => "menu"

  # create one to many (orders) relation
  has_many :orders

  before_save :ensure_authentication_token

  def self.from_omniauth(auth)
    user = where( fb_uid: auth.uid ).first

    unless user
      user = self.new
      user.fb_uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end

    if auth.credentials
      user.fb_access_token = auth.credentials.token
      user.fb_expires_at = Time.at(auth.credentials.expires_at)
    end

    user.save
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

 def self.get_facebook_user_data(access_token)
    conn = Faraday.new(:url => 'https://graph.facebook.com/me')
    response = conn.get "/me", { :access_token => access_token }
    data = JSON.parse(response.body)

    if response.status == 200
      data
    else
      Rails.logger.warn(data)
      nil
    end
  end

  def generate_authentication_token
    token = nil

    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end

    self.authentication_token = token
  end

  protected

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

end
