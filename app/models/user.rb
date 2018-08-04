class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  # this is a class method
  def self.from_omniauth(data)
  # can be accessed by User.from_omniauth
   user = User.find_by(email: data.email)

   if user.confirmed_at.blank?
   	user.confirmed_at = Time.now
   	user.save
   end

   if user.blank?
   	user = User.create(
   			email: data.email,
   			password: SecureRandom.uuid,
   			confirmed_at: Time.now
   		)
   end

   return user

  end


  # for creating an auth token for a user to login using API
  def set_auth_token
    self.auth_token = SecureRandom.uuid

    self.save

    # ideally, check the validity of the auth token and then either return a new one or the same if valid

  end


# assignment
  def remove_auth_token_validity

  end















end
