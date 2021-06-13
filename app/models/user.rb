require "bcrypt"

class User < ApplicationRecord

  has_secure_password

  attr_reader :password

  validates :username, presence:true
  validates :password, length: {minimum:6,allow_nil:true}
  validates :password_digest, presence: {message:"Password invalid"}
  after_initialize :ensure_token

  has_many:subs,
  class_name: "Sub",
  primary_key: :username,
  foreign_key: :moderator,
  dependent: :destroy

  has_many:posts,
  class_name: "Post",
  primary_key: :username,
  foreign_key: :username,
  dependent: :destroy

  has_many:comments,
  class_name: "Comment",
  primary_key: :username,
  foreign_key: :username

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.generate_token
    SecureRandom::urlsafe_base64(16)
  end

  def restart_token
    self.session_token = self.class.generate_token
    self.save!
    self.session_token
  end

  def ensure_token
    self.session_token ||= self.class.generate_token
  end

  def self.find_by_credentials(username,password)
    user = User.find_by(username:username)
    return nil if user.nil?
    user.authenticate(password) ? user:nil
  end

end
